$packageName = 'dartium'

$url = 'https://storage.googleapis.com/dart-archive/channels/stable/release/1.22.0/dartium/dartium-windows-ia32-release.zip'

$binRoot = Get-BinRoot
$installDir = Join-Path $binRoot "dartium"
$unzipLocation = $installDir

if (test-path $installDir) {
	Remove-Item $installDir -Recurse -Force
}

md -Path $installDir

$packageArgs = @{
  packageName    = $packageName
  url            = $url
  unzipLocation  = $unzipLocation
  checksum       = '32ecb8815b7f1cad6cdd9e47e3fdc1a74b53c67a84536b280525b7e9addb82b4'
  checksumType   = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Dartium is zipped inside a folder, so we want to move everything up a level
if ((dir $installDir | measure-object).Count -eq 1) {
	$dartiumSubfolder = (dir $installDir).FullName
	dir $dartiumSubfolder | move-item -Destination $installDir
	remove-item $dartiumSubfolder -Force
}
