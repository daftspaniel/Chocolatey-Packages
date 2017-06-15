$packageName = 'dart-sdk'

$url = 'https://storage.googleapis.com/dart-archive/channels/stable/release/1.24.1/sdk/dartsdk-windows-ia32-release.zip'
$url64 = 'https://storage.googleapis.com/dart-archive/channels/stable/release/1.24.1/sdk/dartsdk-windows-x64-release.zip'

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
  checksum       = '8708a21557ee7b78b95ce46f878ae4c9b6f63aef093f809819311d7b45a867e5'
  checksumType   = 'sha256'
  checksum64     = '3678120998d7a9b7db63fbb04754297c5314b829aa1c232f95b36096d14707e6'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
