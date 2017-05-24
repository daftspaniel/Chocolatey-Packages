$packageName = 'dart-sdk'

$url = 'https://storage.googleapis.com/dart-archive/channels/stable/release/1.24.0/sdk/dartsdk-windows-ia32-release.zip'
$url64 = 'https://storage.googleapis.com/dart-archive/channels/stable/release/1.24.0/sdk/dartsdk-windows-x64-release.zip'

$unzipLocation = Get-BinRoot
$installDir = Join-Path $unzipLocation "dart-sdk"

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
  checksum       = 'e154ab0ba06a0b47d6d080e4c7de74a78076daed2be908ff49bac1691ceff09e'
  checksumType   = 'sha256'
  checksum64     = '97f799cd84899d090d8619348c8daf96dc1c3b53f8bab059ba1bf1d4c82074c6'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
