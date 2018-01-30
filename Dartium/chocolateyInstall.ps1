$packageName = 'dartium'

$url = 'https://storage.googleapis.com/dart-archive/channels/stable/release/1.24.2/dartium/dartium-windows-ia32-release.zip'

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
  checksum       = '0c08f8e8e2b0a2414c6d49fb65eabf48274c03e01d3fd526ee0e3edfe0daf062'
  checksumType   = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Dartium is zipped inside a folder, so we want to move everything up a level
if ((dir $installDir | measure-object).Count -eq 1) {
	$dartiumSubfolder = (dir $installDir).FullName
	dir $dartiumSubfolder | move-item -Destination $installDir
	remove-item $dartiumSubfolder -Force
}
