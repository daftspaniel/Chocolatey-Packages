$packageName = 'dart-sdk'

# https://downloads-archive-dot-dart-lang.appspot.com/tools/download_archive/
$url = 'https://storage.googleapis.com/dart-archive/channels/stable/release/39553/sdk/dartsdk-windows-ia32-release.zip'
$url64 = 'https://storage.googleapis.com/dart-archive/channels/stable/release/39553/sdk/dartsdk-windows-x64-release.zip'

# NYI https://github.com/ferventcoder/checksum/issues/1
$sha = 'cf6ff4187737482b2982b375d9e2d7d486ada4f976f5168df9aee3f813ee8bc8'
$sha64 = '2493af6fc758be669265f7352083db40d74837278b6521b91e76d28a9aeb1d5c'

$binRoot = Get-BinRoot
$installDir = Join-Path $binRoot "$packageName"
Write-Host "Adding `'$installDir\dart-sdk\bin`' to the path and the current shell path"
Install-ChocolateyPath "$installDir\dart-sdk\bin"
$env:Path = "$($env:Path);$installDir\dart-sdk\bin"

Install-ChocolateyZipPackage $packageName $url $installDir $url64