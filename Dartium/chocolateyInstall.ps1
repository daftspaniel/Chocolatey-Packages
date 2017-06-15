$packageName = 'dartium'

$url = 'https://storage.googleapis.com/dart-archive/channels/stable/release/1.24.1/dartium/dartium-windows-ia32-release.zip'

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
  checksum       = '924c9fa60d7943116476262dc1e878a20828d5c606d6780255255e36fd7118ed'
  checksumType   = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Dartium is zipped inside a folder, so we want to move everything up a level
if ((dir $installDir | measure-object).Count -eq 1) {
	$dartiumSubfolder = (dir $installDir).FullName
	dir $dartiumSubfolder | move-item -Destination $installDir
	remove-item $dartiumSubfolder -Force
}
