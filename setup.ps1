# PowerShell setup script for ai-helper submodule
# Usage: Run this script after adding the submodule to your repo

Write-Host "[ai-helper] Starting setup..." -ForegroundColor Cyan

# Check for required tools (e.g., git, node, python, etc.)
# Extend this section as needed for your project

# Example: Check for git
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "[ai-helper] ERROR: git is not installed. Please install git and re-run this script." -ForegroundColor Red
    exit 1
}

# Example: Check for Node.js (if needed)
#if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
#    Write-Host "[ai-helper] ERROR: Node.js is not installed. Please install Node.js and re-run this script." -ForegroundColor Red
#    exit 1
#}

# Detect IDE and set instructions folder
$instructionsPath = $null
if ($env:TERM_PROGRAM -eq "vscode") {
    $instructionsPath = ".copilot/instructions"
    Write-Host "[ai-helper] Detected VS Code. Using $instructionsPath." -ForegroundColor Cyan
} elseif ($env:CURSOR) {
    $instructionsPath = ".cursor/instructions"
    Write-Host "[ai-helper] Detected Cursor. Using $instructionsPath." -ForegroundColor Cyan
} else {
    $instructionsPath = ".copilot/instructions"
    Write-Host "[ai-helper] IDE not detected, defaulting to $instructionsPath." -ForegroundColor Yellow
}

# Create instructions folder if it doesn't exist
if (-not (Test-Path $instructionsPath)) {
    New-Item -ItemType Directory -Path $instructionsPath | Out-Null
    Write-Host "[ai-helper] Created $instructionsPath folder." -ForegroundColor Green
}

# Add reference file
$referenceFile = Join-Path $instructionsPath "ai-helper-submodule.md"
@"
# AI Helper Submodule Reference

This project uses the ai-helper submodule for automation and persona management.

- The ai-helper rules and instructions are available in the submodule's instructions folder.
- To extend or override, add your own markdown or mdc files here referencing the submodule as needed.

Example:
- [ai-helper instructions](../ai-helper/.copilot/instructions/) (if submodule is at ai-helper/)
"@ | Set-Content $referenceFile
Write-Host "[ai-helper] Reference file created at $referenceFile" -ForegroundColor Green

# Add README instructions for submodule setup
# (This section is for the script, not the README file itself)
Write-Host "[ai-helper] To add this helper to your project as a submodule, run:" -ForegroundColor Yellow
Write-Host "  git submodule add <repo-url> ai-helper" -ForegroundColor White
Write-Host "Then run the setup script for your OS:" -ForegroundColor Yellow
Write-Host "  # On Windows:" -ForegroundColor White
Write-Host "  powershell -ExecutionPolicy Bypass -File ./ai-helper/setup.ps1" -ForegroundColor White
Write-Host "  # On Mac/Linux:" -ForegroundColor White
Write-Host "  bash ./ai-helper/setup.sh" -ForegroundColor White
Write-Host "\nSee the reference file in your instructions folder for more details." -ForegroundColor Yellow

Write-Host "[ai-helper] Setup complete! Review the reference file for next steps." -ForegroundColor Green
Write-Host "[ai-helper] Next steps:" -ForegroundColor Yellow
Write-Host "- Review the README.md for usage instructions."
Write-Host "- Customize your automation and personas as needed."
