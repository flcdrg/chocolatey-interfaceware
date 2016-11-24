$ErrorActionPreference = 'Stop';

$packageName= 'iguana.portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://dl.interfaceware.com/iguana/windows/snapshot/iguana_noinstaller_branch_5_6_windows_x86.zip'
$url64      = 'http://dl.interfaceware.com/iguana/windows/snapshot/iguana_noinstaller_branch_5_6_windows_x64.zip'
$checksum   = 'C8DB1ACF58D89FAFE4833C3212387DAA30A5CC563EAA52F91C4C4334DD6DBE00'
$checksum64 = '27BED3B2C37BBA9A8B431DB1E7C645F97CD8AB61C945F7E505F08E610CE9EE3C'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  url64bit      = $url64

  softwareName  = 'iguana.portable*'

  checksum      = $checksum
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$files = get-childitem $toolsDir -include *.exe -recurse

foreach ($file in $files) {
  #generate an ignore file
  New-Item "$file.ignore" -type file -force | Out-Null
}