# ==============================================================================
# YuanQi Tech Logo Skill Installer for Windows (PowerShell)
# Supports: Antigravity, Claude Code, OpenAI Codex, Tencent WorkBuddy, Cursor
# Installation via HTTPS or SSH
# ==============================================================================

param(
    [switch]$Ssh,
    [switch]$Https,
    [string]$Repo = "",
    [string]$TargetAgent = "all",
    [string]$ProjectPath = ""
)

$skillName = "yuanqi-logo-assets"
$defaultRepoHttps = "https://github.com/yuanqitech/yuanqi-logo-assets.git"
$defaultRepoSsh = "git@github.com:yuanqitech/yuanqi-logo-assets.git"

$protocol = if ($Ssh) { "ssh" } else { "https" }
$repoUrl = if ($Repo -ne "") { $Repo } elseif ($Ssh) { $defaultRepoSsh } else { $defaultRepoHttps }
$userHome = [Environment]::GetFolderPath("UserProfile")

Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "  YuanQi Tech Logo Skill Installer (Windows PowerShell)" -ForegroundColor Cyan
Write-Host "  Protocol : $protocol" -ForegroundColor Cyan
Write-Host "  Target   : $TargetAgent" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan

$tempDir = $null
$workDir = $null

if ($PSScriptRoot -and (Test-Path "$PSScriptRoot\SKILL.md")) {
    $workDir = $PSScriptRoot
    Write-Host ">> Running from local directory: $workDir" -ForegroundColor Green
} else {
    Write-Host ">> Remote installation detected. Cloning repository..." -ForegroundColor Yellow
    $tempDir = Join-Path ([System.IO.Path]::GetTempPath()) ("skill_" + [System.Guid]::NewGuid().ToString("N"))
    New-Item -ItemType Directory -Force -Path $tempDir | Out-Null
    git clone --depth 1 $repoUrl (Join-Path $tempDir $skillName)
    $workDir = Join-Path $tempDir $skillName
}

function Copy-SkillDir($destDir) {
    if (-not (Test-Path $destDir)) {
        New-Item -ItemType Directory -Force -Path $destDir | Out-Null
    }
    Copy-Item -Recurse -Force "$workDir\*" $destDir
    Write-Host " [OK] Installed to: $destDir" -ForegroundColor Green
}

# 1. Google Antigravity
if ($TargetAgent -eq "all" -or $TargetAgent -eq "antigravity") {
    Write-Host "`n>> Installing for Google Antigravity..." -ForegroundColor Yellow
    Copy-SkillDir "$userHome\.gemini\config\skills\$skillName"
}

# 2. Anthropic Claude Code
if ($TargetAgent -eq "all" -or $TargetAgent -eq "claude") {
    Write-Host "`n>> Installing for Claude Code..." -ForegroundColor Yellow
    Copy-SkillDir "$userHome\.claude\skills\$skillName"
}

# 3. Tencent WorkBuddy
if ($TargetAgent -eq "all" -or $TargetAgent -eq "workbuddy") {
    Write-Host "`n>> Installing for Tencent WorkBuddy..." -ForegroundColor Yellow
    Copy-SkillDir "$userHome\.workbuddy\skills\$skillName"
}

# 4. Project Workspace
if ($ProjectPath -ne "") {
    Write-Host "`n>> Installing into project workspace: $ProjectPath" -ForegroundColor Yellow
    Copy-SkillDir "$ProjectPath\.agents\skills\$skillName"
    Copy-SkillDir "$ProjectPath\.claude\skills\$skillName"
    Copy-SkillDir "$ProjectPath\.workbuddy\skills\$skillName"

    if (-not (Test-Path "$ProjectPath\CLAUDE.md")) {
        Copy-Item "$workDir\CLAUDE.md" "$ProjectPath\CLAUDE.md"
        Write-Host " [OK] Injected CLAUDE.md to project root." -ForegroundColor Green
    }
    if (-not (Test-Path "$ProjectPath\AGENTS.md")) {
        Copy-Item "$workDir\AGENTS.md" "$ProjectPath\AGENTS.md"
        Write-Host " [OK] Injected AGENTS.md to project root." -ForegroundColor Green
    }
}

if ($tempDir -and (Test-Path $tempDir)) {
    Remove-Item -Recurse -Force $tempDir -ErrorAction SilentlyContinue
}

Write-Host "`n============================================================" -ForegroundColor Cyan
Write-Host "  Installation Completed! Skill is ready across agents." -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan
