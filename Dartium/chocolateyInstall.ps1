$packageName = 'dartium'

$url = 'https://storage.googleapis.com/dart-archive/channels/stable/release/1.24.0/dartium/dartium-windows-ia32-release.zip'

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
  checksum       = 'ea0d5111ddf562685f87f5bceea7b2f931a2102fa1fd65543c7cc81df7aedbd3'
  checksumType   = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Dartium is zipped inside a folder, so we want to move everything up a level
if ((dir $installDir | measure-object).Count -eq 1) {
	$dartiumSubfolder = (dir $installDir).FullName
	dir $dartiumSubfolder | move-item -Destination $installDir
	remove-item $dartiumSubfolder -Force
}
