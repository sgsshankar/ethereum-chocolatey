$packageName    = 'Ethereum'

$source = "https://build.ethdev.com/builds/Windows%20C%2b%2b%20master%20branch/Ethereum-win64-latest.exe" #Always gets the latest version
$destination = "$env:temp\Ethereum-win64-latest.exe"

$check=0
$getInstall = Get-WmiObject -Class Win32_Product  | select Name
Foreach ($String in $getInstall)
{
if ($String -like '*Microsoft Visual C++ 2013*') {
    $check=1
}
}

if($check -eq 1) {
Write-Host Let me get the latest version for you. I am copying it in your temp folder:
Write-Host   $destination 

try {Invoke-WebRequest $source -OutFile "$destination"} catch {
Write-Output "Not able to download file. Check if you are running powershell 3.0 or above. Download from https://www.microsoft.com/en-us/download/details.aspx?id=34595"
exit
}

Start-Process $destination -Wait

Write-Host Cleaning up the downloaded file from the temp folder.
remove-item "$destination"
}
else {
Write-Output "Download the 32-bit version (vcredist_x86.exe) even when you have a 64-bit version of Windows from http://www.microsoft.com/en-US/download/details.aspx?id=40784"
exit
}
