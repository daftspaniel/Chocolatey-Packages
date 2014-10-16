$packageName = 'dart-sdk'

# https://www.dartlang.org/tools/download_archive/
$url = 'https://storage.googleapis.com/dart-archive/channels/stable/release/41096/sdk/dartsdk-windows-ia32-release.zip'
$url64 = 'https://storage.googleapis.com/dart-archive/channels/stable/release/41096/sdk/dartsdk-windows-x64-release.zip'

# NYI https://github.com/ferventcoder/checksum/issues/1
$sha = ''
$sha64 = ''

$binRoot = Get-BinRoot
$installDir = Join-Path $binRoot "$packageName"
Write-Host "Adding `'$installDir\dart-sdk\bin`' to the path and the current shell path"
Install-ChocolateyPath "$installDir\dart-sdk\bin"
Install-ChocolateyPath "${env:USERPROFILE}\AppData\Roaming\Pub\Cache\bin"

$env:Path = "$($env:Path);$installDir\dart-sdk\bin;${env:USERPROFILE}\AppData\Roaming\Pub\Cache\bin"

Install-ChocolateyZipPackage $packageName $url $installDir $url64