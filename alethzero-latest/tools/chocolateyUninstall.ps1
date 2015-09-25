$packageName = 'Ethereum'
$installPath = "C:\Program Files"
$program = "Uninstall.exe"

$app = Get-ChildItem -Path $installPath | Where-Object {$_.FullName -like '*Ether*'  } | select FullName
cd $app.FullName
Start-Process $program -Wait

