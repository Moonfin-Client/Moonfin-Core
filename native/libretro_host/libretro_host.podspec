Pod::Spec.new do |s|
  s.name             = 'libretro_host'
  s.version          = '0.1.0'
  s.summary          = 'Portable libretro host.'
  s.description      = 'Loads a libretro core and runs it, converting video, mixing audio, and handling save states.'
  s.homepage         = 'https://github.com/moonfin'
  s.license          = { :type => 'MIT' }
  s.author           = 'Moonfin'
  s.source           = { :path => '.' }
  s.source_files     = 'libretro_host.c', 'libretro_host.h', 'libretro.h'
  s.public_header_files = 'libretro_host.h'
  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '11.0'
  # The per-frame pixel conversion is too slow at -O0, so Debug builds still
  # compile the host optimized.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'GCC_OPTIMIZATION_LEVEL' => '2' }
end
