#!/usr/bin/env ruby
# Wires the AetherEngine playback stack into the iOS Runner project:
# - adds ios/Runner/Playback/**/* sources to the Runner target
# - adds the AetherEngine SPM package (AETHER_LOCAL=1 uses the sibling
#   checkout at ../../AetherEngine for development)
# - adds the standalone libass package for host-side ASS rendering
# Idempotent. Run after project regeneration or when Playback/ files change.
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

# The engine wrapper layer (AetherPlayerWrapper, PlayerTypes, SubtitleOverlay,
# AssRenderer, SubtitleFontLocator, NowPlayingController) is shared with the
# tvOS target and lives in the tvOS tree. Platform deltas are #if os(...)
# guarded inside the files.
shared_dir = File.expand_path(
  File.join(project_dir, '..', 'tvos', 'Runner', 'Playback', 'Aether'))
abs_files += Dir.glob(File.join(shared_dir, '*.swift')).sort

# Theme-music and inline-preview channels are pure AVFoundation and shared
# with tvOS verbatim (same channel names, so the Dart side needs no changes).
tvos_runner = File.expand_path(File.join(project_dir, '..', 'tvos', 'Runner'))
abs_files += [
  File.join(tvos_runner, 'AppleTvThemeMusicChannel.swift'),
  File.join(tvos_runner, 'AppleTvPreviewChannel.swift'),
].select { |f| File.exist?(f) }
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
  f.referrers.grep(Xcodeproj::Project::Object::PBXBuildFile).each(&:remove_from_project)
  f.remove_from_project
end

abs_files.each do |abs|
  ref = playback_group.new_reference(abs)
  target.add_file_references([ref]) unless File.extname(abs) == '.h'
  puts "added source: #{File.basename(abs)}"
end

# --- AetherEngine ---
# The trust hook the engine needs for a self signed origin lives on the
# fork and has no upstream release yet, so this pins a revision rather than
# a version. Move it back to an upstream tag once the hook lands there.
aether_remote_url = 'https://github.com/RadicalMuffinMan/AetherEngine'
aether_revision = '2e388e39ac4eecd7c3ad033b003f0172903ea5d3'
aether_local_path = File.expand_path(File.join(project_dir, '..', '..', 'AetherEngine'))
use_local_aether = ENV['AETHER_LOCAL'] == '1'

if use_local_aether && !File.directory?(aether_local_path)
  abort("AETHER_LOCAL=1 but no checkout at #{aether_local_path}")
end

project.root_object.package_references.dup.each do |p|
  is_remote_aether = p.respond_to?(:repositoryURL) &&
                     File.basename(p.repositoryURL.to_s.chomp('/'), '.git') == 'AetherEngine'
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

# Match on the repository name rather than the whole url. A url that does not
# match adds a second reference for the same product, and the project then
# fails to resolve.
aether_pkg = project.root_object.package_references.find do |p|
  (p.respond_to?(:repositoryURL) &&
   File.basename(p.repositoryURL.to_s.chomp('/'), '.git') == 'AetherEngine') ||
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
    aether_pkg.requirement = { 'kind' => 'revision', 'revision' => aether_revision }
    puts "added AetherEngine remote package reference (#{aether_revision})"
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
  config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '16.0'
end

project.build_configurations.each do |config|
  config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '16.0'
end

project.save
puts 'saved project'
