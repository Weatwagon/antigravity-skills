<#
.SYNOPSIS
    Antigravity Skills Suite Unified Installer
.DESCRIPTION
    Self-healing installer that initializes Git submodules if missing and deploys all Antigravity skills.
#>

[CmdletBinding()]
param(
    [string]$TargetDir = "$HOME\.gemini",
    [switch]$InstallPonytail
)

$ErrorActionPreference = "Stop"

Write-Host "
⚡ ANTIGRAVITY SKILLS SUITE INSTALLER" -ForegroundColor Cyan
Write-Host "-------------------------------------------------------" -ForegroundColor DarkGray

$root = $PSScriptRoot
$skillsDir = Join-Path $root "skills"
$approveForMeDir = Join-Path $skillsDir "approve-for-me"
$reviewLoopDir = Join-Path $skillsDir "review-loop"

# 1. Self-Healing Submodule Detection
$needsSubmodules = (-not (Test-Path (Join-Path $approveForMeDir "install.ps1"))) -or (-not (Test-Path (Join-Path $reviewLoopDir "install.ps1")))

if ($needsSubmodules) {
    Write-Host "[*] Submodules detected as uninitialized. Auto-healing..." -ForegroundColor Yellow
    $gitCmd = Get-Command git -ErrorAction SilentlyContinue
    if (-not $gitCmd) {
        Write-Error "Git is required to initialize submodules but was not found in PATH. Please run 'git submodule update --init --recursive' manually."
        exit 1
    }
    
    try {
        Push-Location $root
        git submodule update --init --recursive
        Pop-Location
        Write-Host "[+] Submodules successfully initialized!" -ForegroundColor Green
    } catch {
        Write-Error "Failed to auto-initialize submodules: $_"
        exit 1
    }
}

# 2. Install Approve for Me Skill
$approveInstaller = Join-Path $approveForMeDir "install.ps1"
if (Test-Path $approveInstaller) {
    Write-Host "`n[*] Installing 'Approve for Me' skill..." -ForegroundColor Yellow
    $params = @{ TargetDir = $TargetDir }
    if ($InstallPonytail) { $params["InstallPonytail"] = $true }
    & $approveInstaller @params
} else {
    Write-Warning "Could not find Approve for Me installer at $approveInstaller"
}

# 3. Install Review Loop Skill
$reviewInstaller = Join-Path $reviewLoopDir "install.ps1"
if (Test-Path $reviewInstaller) {
    Write-Host "`n[*] Installing 'Review Loop' skill..." -ForegroundColor Yellow
    & $reviewInstaller -Scope Global
} else {
    Write-Warning "Could not find Review Loop installer at $reviewInstaller"
}

Write-Host "
=======================================================" -ForegroundColor DarkGray
Write-Host "✓ ALL ANTIGRAVITY SKILLS SUCCESSFULLY INSTALLED!" -ForegroundColor Green
Write-Host "=======================================================" -ForegroundColor DarkGray
Write-Host "Active Skills:" -ForegroundColor White
Write-Host "  * Approve for Me (Auto-Review Guardian)" -ForegroundColor Gray
Write-Host "  * Review Loop (Autonomous Gated Engineering)" -ForegroundColor Gray
Write-Host "`nRun 'guardian status' or '/review-loop' to begin!" -ForegroundColor Cyan
