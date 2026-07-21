Pod::Spec.new do |s|
  s.name             = 'moonfin_game_host'
  s.version          = '0.1.0'
  s.summary          = 'Native libretro game playback for iOS.'
  s.description      = 'Bridges the shared libretro host to a Flutter texture, audio, and controller input.'
  s.homepage         = 'https://github.com/moonfin'
  s.license          = { :type => 'MIT' }
  s.author           = 'Moonfin'
  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*.swift'
  # Cores are fetched into cores/ by fetch_cores.sh (build_cores.sh for a
  # release build) before pod install and embedded so the app loads them
  # without downloading. The App Store forbids downloading executable code.
  s.vendored_frameworks = 'cores/*.framework'
  s.dependency 'Flutter'
  s.dependency 'libretro_host'
  s.platform         = :ios, '15.0'
  s.swift_version    = '5.0'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
end
