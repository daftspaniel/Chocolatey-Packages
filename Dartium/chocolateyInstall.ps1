$packageName = 'dartium'

$url = 'https://storage.googleapis.com/dart-archive/channels/stable/release/1.12.0/dartium/dartium-windows-ia32-release.zip'

$binRoot = Get-BinRoot
$installDir = Join-Path $binRoot "dartium"

if (test-path $installDir) {
	Remove-Item $installDir -Recurse -Force
}

Install-ChocolateyZipPackage $packageName $url $installDir

# Dartium is zipped inside a folder, so we want to move everything up a level
if ((dir $installDir | measure-object).Count -eq 1) {
	$dartiumSubfolder = (dir $installDir).FullName
	dir $dartiumSubfolder | move-item -Destination $installDir
	remove-item $dartiumSubfolder -Force
}