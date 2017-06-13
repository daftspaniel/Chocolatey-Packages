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
  checksum       = 'e8bbe9ad99891cc143793e04e1d1a754994d1ed7021dc86d74a1d74b9fc5a229'
  checksumType   = 'sha256'
  checksum64     = 'f55551a0e9d4440b1fc646556de66b91dd4bdcb537c6372ca82dfbe57c46e9c0'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
