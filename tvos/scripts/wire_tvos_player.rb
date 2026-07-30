#!/usr/bin/env ruby
require 'xcodeproj'

project_dir = File.expand_path(File.join(__dir__, '..'))
project_path = File.join(project_dir, 'Runner.xcodeproj')
project = Xcodeproj::Project.open(project_path)
target = project.targets.find { |t| t.name == 'Runner' } or abort('Runner target not found')

playback_group = project.main_group.find_subpath('Runner/Playback', true)
playback_group.set_source_tree('SOURCE_ROOT')
playback_group.set_path('Runner/Playback')

source_exts = %w[.swift .c .m .mm]
abs_files = Dir.glob(File.join(project_dir, 'Runner/Playback/**/*'))
  .select { |f| source_exts.include?(File.extname(f)) }.sort
basenames = abs_files.map { |f| File.basename(f) }

# Drop references this script is about to re-add, and any left pointing at a
# playback file that no longer exists. Without the second case a deleted source
# stays in the Sources phase forever and the build fails on a missing input.
playback_root = File.join(project_dir, 'Runner/Playback')
project.files.select do |f|
  next true if basenames.include?(File.basename(f.path.to_s))
  begin
    path = f.real_path.to_s
    path.start_with?(playback_root) && !File.exist?(path)
  rescue StandardError
    false
  end
end.each do |f|
  puts "removed missing source: #{File.basename(f.path.to_s)}" unless
    basenames.include?(File.basename(f.path.to_s))
  f.referrers.grep(Xcodeproj::Project::Object::PBXBuildFile).each(&:remove_from_project)
  f.remove_from_project
end

abs_files.each do |abs|
  ref = playback_group.new_reference(abs)
  target.add_file_references([ref]) unless File.extname(abs) == '.h'
  puts "added source: #{File.basename(abs)}"
end

# --- MPVKit removal (replaced by AetherEngine) ---
# Clean any MPVKit package reference, product link, and module-map patch step
# from projects generated before the AetherEngine migration.
mpvkit_url = 'https://github.com/mpvkit/MPVKit'
project.root_object.package_references.dup.each do |p|
  next unless p.respond_to?(:repositoryURL) && p.repositoryURL == mpvkit_url
  target.package_product_dependencies.dup.each do |d|
    next unless d.product_name == 'MPVKit'
    d.referrers.grep(Xcodeproj::Project::Object::PBXBuildFile).each(&:remove_from_project)
    target.package_product_dependencies.delete(d)
    d.remove_from_project
  end
  project.root_object.package_references.delete(p)
  p.remove_from_project
  puts 'removed MPVKit package reference'
end
target.build_phases.dup.each do |phase|
  next unless phase.respond_to?(:name) && phase.name == 'Patch MPVKit Module Maps'
  target.build_phases.delete(phase)
  phase.remove_from_project
  puts 'removed MPVKit module-map patch phase'
end

# --- AetherEngine ---
# AETHER_LOCAL=1 wires the sibling checkout (../../AetherEngine) for
# development, otherwise the pinned remote release is used.
aether_remote_url = 'https://github.com/superuser404notfound/AetherEngine'
aether_version = '6.0.2'
aether_local_path = File.expand_path(File.join(project_dir, '..', '..', 'AetherEngine'))
use_local_aether = ENV['AETHER_LOCAL'] == '1'

if use_local_aether && !File.directory?(aether_local_path)
  abort("AETHER_LOCAL=1 but no checkout at #{aether_local_path}")
end

# Drop whichever Aether reference kind is not wanted so local/remote can be toggled.
project.root_object.package_references.dup.each do |p|
  is_remote_aether = p.respond_to?(:repositoryURL) && p.repositoryURL == aether_remote_url
  is_local_aether = p.is_a?(Xcodeproj::Project::Object::XCLocalSwiftPackageReference) &&
                    File.basename(p.relative_path.to_s) == 'AetherEngine'
  next unless (is_remote_aether && use_local_aether) || (is_local_aether && !use_local_aether)
  target.package_product_dependencies.dup.each do |d|
    next unless d.package&.uuid == p.uuid
    d.referrers.grep(Xcodeproj::Project::Object::PBXBuildFile).each(&:remove_from_project)
    target.package_product_dependencies.delete(d)
    d.remove_from_project
  end
  project.root_object.package_references.delete(p)
  p.remove_from_project
  puts 'removed stale AetherEngine package reference'
end

aether_pkg = project.root_object.package_references.find do |p|
  (p.respond_to?(:repositoryURL) && p.repositoryURL == aether_remote_url) ||
    (p.is_a?(Xcodeproj::Project::Object::XCLocalSwiftPackageReference) &&
     File.basename(p.relative_path.to_s) == 'AetherEngine')
end
unless aether_pkg
  if use_local_aether
    aether_pkg = project.new(Xcodeproj::Project::Object::XCLocalSwiftPackageReference)
    aether_pkg.relative_path = aether_local_path
    puts "added AetherEngine local package reference (#{aether_local_path})"
  else
    aether_pkg = project.new(Xcodeproj::Project::Object::XCRemoteSwiftPackageReference)
    aether_pkg.repositoryURL = aether_remote_url
    aether_pkg.requirement = { 'kind' => 'exactVersion', 'version' => aether_version }
    puts "added AetherEngine remote package reference (#{aether_version})"
  end
  project.root_object.package_references << aether_pkg
end

unless target.package_product_dependencies.any? { |d| d.product_name == 'AetherEngine' }
  dep = project.new(Xcodeproj::Project::Object::XCSwiftPackageProductDependency)
  dep.package = aether_pkg
  dep.product_name = 'AetherEngine'
  target.package_product_dependencies << dep
  bf = project.new(Xcodeproj::Project::Object::PBXBuildFile)
  bf.product_ref = dep
  target.frameworks_build_phase.files << bf
  puts 'linked AetherEngine product'
end

# --- libass (standalone, for host-side ASS subtitle rendering) ---
# Provides the same Libass clang module AssRenderer imports, keeping ASS
# rendering working now that MPVKit no longer vendors it.
libass_url = 'https://github.com/mpvkit/libass-build'
libass_pkg = project.root_object.package_references.find do |p|
  p.respond_to?(:repositoryURL) && p.repositoryURL == libass_url
end
unless libass_pkg
  libass_pkg = project.new(Xcodeproj::Project::Object::XCRemoteSwiftPackageReference)
  libass_pkg.repositoryURL = libass_url
  libass_pkg.requirement = { 'kind' => 'exactVersion', 'version' => '0.17.5' }
  project.root_object.package_references << libass_pkg
  puts 'added libass package reference'
end

unless target.package_product_dependencies.any? { |d| d.product_name == 'libass' }
  dep = project.new(Xcodeproj::Project::Object::XCSwiftPackageProductDependency)
  dep.package = libass_pkg
  dep.product_name = 'libass'
  target.package_product_dependencies << dep
  bf = project.new(Xcodeproj::Project::Object::PBXBuildFile)
  bf.product_ref = dep
  target.frameworks_build_phase.files << bf
  puts 'linked libass product'
end

target.build_configurations.each do |config|
  config.build_settings['SWIFT_OBJC_BRIDGING_HEADER'] ||= 'Runner/Runner-Bridging-Header.h'
  config.build_settings['TVOS_DEPLOYMENT_TARGET'] = '17.0'
end

project.build_configurations.each do |config|
  config.build_settings['TVOS_DEPLOYMENT_TARGET'] = '17.0'
end

project.save
puts 'saved project'
