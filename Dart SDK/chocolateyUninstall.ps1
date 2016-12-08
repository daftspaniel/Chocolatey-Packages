$installDir = Join-Path $env:ChocolateyBinRoot "dart-sdk"

if (test-path $installDir) {
	Remove-Item $installDir -Recurse -Force
}
