# Define the username to check
$usernameToCheck = "localgroup"

# Define the log file path
$logFilePath = "C:\Users\TheKid\OneDrive\Desktop\log"  
$batchScriptPath = "C:\Users\TheKid\OneDrive\Desktop\Random_Hacking\Pentesting Application\Main_Scripts_Copy\usercopy.bat" 

# Loop
while ($true) {
    # Check if the user exists
    $userExists = Get-LocalUser  -Name $usernameToCheck -ErrorAction SilentlyContinue

    if ($userExists) {
        Write-Host "User  '$usernameToCheck' exists." > C:\Users\TheKid\OneDrive\Desktop\log
    } else {
        Write-Host "User  '$usernameToCheck' does not exist."
        
        $logMessage = "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - User '$usernameToCheck' does not exist."
        Add-Content -Path $logFilePath -Value $logMessage
        
        Start-Process -FilePath $batchScriptPath
    }

    Start-Sleep -Seconds 20
}