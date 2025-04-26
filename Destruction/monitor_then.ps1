#FOR TESTING PURPOSES ONLY DJRK
# Prompt the user to enter a username
$usernameToCheck = Read-Host -Prompt "Enter the username to check"

$logFilePath = "C:"  
$batchScriptPath = "C:" 

while ($true) {
    try {
        $userExists = Get-LocalUser  -Name $usernameToCheck -ErrorAction SilentlyContinue

        if ($userExists) {
            # Log that the user exists
            $logMessage = "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - User '$usernameToCheck' exists."
            Add-Content -Path $logFilePath -Value $logMessage
        } else {
            # Log that the user does not exist
            $logMessage = "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - User '$usernameToCheck' does not exist."
            Add-Content -Path $logFilePath -Value $logMessage
            
            # Start the batch script
            Start-Process -FilePath $batchScriptPath
        }
    } catch {
      
        $errorMessage = "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - Error: $_"
        Add-Content -Path $logFilePath -Value $errorMessage
    }

    Start-Sleep -Seconds 6  
}
