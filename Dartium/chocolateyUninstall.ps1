$unzipLocation = Get-BinRoot
$installDir = Join-Path $unzipLocation "dartium"

if (test-path $installDir) {
	Remove-Item $installDir -Recurse -Force
}
