$installDir = Join-Path $env:ChocolateyBinRoot "dartium"

if (test-path $installDir) {
	Remove-Item $installDir -Recurse -Force
}
