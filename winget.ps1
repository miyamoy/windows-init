# Set PowerShell Execution Policy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process

# Install by winget
## Chrome
winget install --id Google.Chrome --source winget

## VSCode
winget install --id Microsoft.VisualStudioCode --source winget

## Windows Terminal
winget install --id Microsoft.WindowsTerminal --source winget

## PowerShell(v7)
winget install --id Microsoft.PowerShell --source winget

## Git
winget install --id Git.Git --source winget

# Auto Dark Mode
winget install --id Armin2208.WindowsAutoNightMode --source winget

# Rancher Desktop
winget install --id suse.RancherDesktop --source winget

# Notion
winget install --id Notion.Notion --source winget

# Obsidian
winget install --id Obsidian.Obsidian --source winget

# Google Japanese IME
winget install --id Google.JapaneseIME --source winget

# AWS CLI
winget install --id "Amazon.AWSCLI" --source winget
