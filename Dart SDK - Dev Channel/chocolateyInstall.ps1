$packageName = 'dart-sdk-dev'

$url = 'https://storage.googleapis.com/dart-archive/channels/dev/release/1.14.0-dev.6.0/sdk/dartsdk-windows-ia32-release.zip'
$url64 = 'https://storage.googleapis.com/dart-archive/channels/dev/release/1.14.0-dev.6.0/sdk/dartsdk-windows-x64-release.zip'

$unzipDir = Get-BinRoot
$installDir = Join-Path $unzipDir "dart-sdk-dev"

Install-ChocolateyPath "$installDir\bin"
Install-ChocolateyPath "${env:USERPROFILE}\AppData\Roaming\Pub\Cache\bin"
$env:Path = "$($env:Path);$installDir\bin;${env:USERPROFILE}\AppData\Roaming\Pub\Cache\bin"

if (test-path $installDir) {
	Remove-Item $installDir -Recurse -Force
}
Install-ChocolateyZipPackage $packageName $url $installDir $url64
