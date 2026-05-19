param(
	[string[]]$FlutterArgs = @()
)

# Set the build flag for this process only
$env:MOONFIN_BETA_BUILD = "true"

# wipe out the windows build directory if you're running into build problems
#$buildDir = Join-Path $PSScriptRoot "build\windows\x64"
#if (Test-Path $buildDir) {
#	Write-Host "Removing existing Windows build dir: $buildDir"
#	Remove-Item -Recurse -Force $buildDir
#}

# Ensure the dart-define is passed to the Flutter tool so `const.fromEnvironment`
# in Dart will be set at compile time. Also allow additional args to be passed.
$argsList = @("build", "windows", "--release") + $FlutterArgs
if (-not ($argsList -contains "--dart-define=MOONFIN_BETA_BUILD=true")) {
	$argsList += "--dart-define=MOONFIN_BETA_BUILD=true"
}
Write-Host "Running: flutter $($argsList -join ' ')"
& flutter @argsList
$exit = $LASTEXITCODE
if ($exit -ne 0) {
	Write-Error "flutter build windows failed with exit code $exit"
	exit $exit
}

Write-Host "Built Windows Beta version"
