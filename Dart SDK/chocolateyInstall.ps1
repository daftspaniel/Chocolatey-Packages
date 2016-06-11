$packageName = 'dart-sdk'

$url = 'https://storage.googleapis.com/dart-archive/channels/stable/release/1.17.1/sdk/dartsdk-windows-ia32-release.zip'
$url64 = 'https://storage.googleapis.com/dart-archive/channels/stable/release/1.17.1/sdk/dartsdk-windows-x64-release.zip'

$unzipDir = Get-BinRoot # NOTE: We're not adding dart-sdk to the end, as that's already in the zip file.
$installDir = Join-Path $unzipDir "dart-sdk"

Install-ChocolateyPath "$installDir\bin"
Install-ChocolateyPath "${env:USERPROFILE}\AppData\Roaming\Pub\Cache\bin"
$env:Path = "$($env:Path);$installDir\bin;${env:USERPROFILE}\AppData\Roaming\Pub\Cache\bin"

if (test-path $installDir) {
	Remove-Item $installDir -Recurse -Force
}
Install-ChocolateyZipPackage $packageName $url $unzipDir $url64
