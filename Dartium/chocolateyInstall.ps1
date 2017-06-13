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
  checksum       = '6c27b0923f105d8d8920f5bd0117f482e287fbfe016529900e4ec0e7abaec127'
  checksumType   = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Dartium is zipped inside a folder, so we want to move everything up a level
if ((dir $installDir | measure-object).Count -eq 1) {
	$dartiumSubfolder = (dir $installDir).FullName
	dir $dartiumSubfolder | move-item -Destination $installDir
	remove-item $dartiumSubfolder -Force
}
