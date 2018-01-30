$packageName = 'dart-sdk-dev'

$url = 'https://storage.googleapis.com/dart-archive/channels/dev/release/2.0.0-dev.5.0/sdk/dartsdk-windows-ia32-release.zip'
$url64 = 'https://storage.googleapis.com/dart-archive/channels/dev/release/2.0.0-dev.5.0/sdk/dartsdk-windows-x64-release.zip'

$unzipLocation = Get-BinRoot
$installDir = Join-Path $unzipLocation "dart-sdk-dev"

Install-ChocolateyPath "$installDir\bin"
Install-ChocolateyPath "${env:USERPROFILE}\AppData\Roaming\Pub\Cache\bin"
$env:Path = "$($env:Path);$installDir\bin;${env:USERPROFILE}\AppData\Roaming\Pub\Cache\bin"

if (test-path $installDir) {
	Remove-Item $installDir -Recurse -Force
}

$packageArgs = @{
  packageName    = $packageName
  url            = $url
  url64bit       = $url64
  unzipLocation  = $unzipLocation
  checksum       = 'c7724592c0ccbdb23818dbcde8ae3d03b5bb6ba85409022f60ca6a782f50e6b3'
  checksumType   = 'sha256'
  checksum64     = '45d7f31cda0c68f0b3e803a9c3d97e7ec4bbf537d9691ea6d986f34e8161531c'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
