$package = 'DartEditor'

  $location = Join-Path $Env:SystemDrive $Env:Chocolatey_Bin_Root
  if (!(Test-Path $location))
  {
    $location = Join-Path $Env:SystemDrive 'tools'
  }
  $location = Join-Path $location 'dart'

  if (Test-Path $location)
  {
    Remove-Item $location -Recurse -Force
  }

  Push-Location $Env:ChocolateyInstall\bin
  $binrunner = 'DartEditor.exe'
  if (Test-Path $binrunner)
  {
    Remove-Item $binrunner
  }
  Pop-Location

