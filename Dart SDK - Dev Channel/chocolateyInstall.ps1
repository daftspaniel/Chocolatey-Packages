$packageName = 'dart-sdk-dev'

$url = 'https://storage.googleapis.com/dart-archive/channels/dev/release/2.0.0-dev.3.0/sdk/dartsdk-windows-ia32-release.zip'
$url64 = 'https://storage.googleapis.com/dart-archive/channels/dev/release/2.0.0-dev.3.0/sdk/dartsdk-windows-x64-release.zip'

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
  checksum       = '4128fd38b6807b2f533975e6aa5e358ba515f7a7ee1d2069330ba53c8c08f3db'
  checksumType   = 'sha256'
  checksum64     = '8a6c457ce6af045f5b0cdebbbbd0da48519e2dd7e0aaa6cbccdbfef5e0af78ef'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
