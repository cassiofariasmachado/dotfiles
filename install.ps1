$ErrorActionPreference = "Stop"

$PROFILE_NAME = ""
$SHOW_HELP = $false
$DOTBOT_ARGS = @()

for ($i = 0; $i -lt $Args.Count; $i++) {
    switch ($Args[$i]) {
        "--work" {
            $PROFILE_NAME = "work"
        }
        "-w" {
            $PROFILE_NAME = "work"
        }
        "--personal" {
            $PROFILE_NAME = "personal"
        }
        "-p" {
            $PROFILE_NAME = "personal"
        }
        "--help" {
            $SHOW_HELP = $true
        }
        "-h" {
            $SHOW_HELP = $true
        }
        default {
            $DOTBOT_ARGS += $Args[$i]
        }
    }
}

if ($SHOW_HELP) {
    Write-Host @"
Installs the dotfiles configuration.

Usage:
  $PSCommandPath [flags]

Flags:
  --work, -w                                 Use work profile
  --personal, -p                             Use personal profile
  -h, --help                                 Show help
"@
    exit 0
}

if ([string]::IsNullOrWhiteSpace($PROFILE_NAME)) {
    Write-Error "Error: profile not selected. Use --personal/-p or --work/-w."
    exit 1
}

$env:PROFILE = $PROFILE_NAME

$CONFIG = "install.conf.yaml"
$DOTBOT_DIR = "external/dotbot"

$DOTBOT_BIN = "bin/dotbot"
$BASEDIR = $PSScriptRoot

Set-Location $BASEDIR
git -C $DOTBOT_DIR submodule sync --quiet --recursive
git submodule update --init --recursive $DOTBOT_DIR

foreach ($PYTHON in ('python', 'python3')) {
    # Python redirects to Microsoft Store in Windows 10 when not installed
    if (& { $ErrorActionPreference = "SilentlyContinue"
            ![string]::IsNullOrEmpty((&$PYTHON -V))
            $ErrorActionPreference = "Stop" }) {
        &$PYTHON $(Join-Path $BASEDIR -ChildPath $DOTBOT_DIR | Join-Path -ChildPath $DOTBOT_BIN) -d $BASEDIR -c $CONFIG $DOTBOT_ARGS
        Remove-Item Env:PROFILE -ErrorAction SilentlyContinue
        return
    }
}

Remove-Item Env:PROFILE -ErrorAction SilentlyContinue
Write-Error "Error: Cannot find Python."
