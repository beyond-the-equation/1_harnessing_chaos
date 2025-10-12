#!/usr/bin/env pwsh

param (
    [string]$Task = "default"
)

# Activate the project, instantiate it and run Pluto.jl
function Run {
    julia -e 'using Pkg; Pkg.activate("."); Pkg.instantiate(); using Pluto; Pluto.run();'
}

# Update dependencies
function Update {
    julia -e 'using Pkg; Pkg.activate("."); Pkg.update();'
}

# Format Julia files
function Format {
    julia -e 'using Pkg; Pkg.activate("."); Pkg.instantiate(); using JuliaFormatter; JuliaFormatter.format(".");'
}

# The default task
function Default {
    $scriptName = Split-Path -Leaf $MyInvocation.PSCommandPath
    Write-Host "Usage: .\$scriptName [<task>]"
    Write-Host "Available tasks:"
    Write-Host "    format  # Format Julia files [alias: fmt]"
    Write-Host "    run     # Activate the project, instantiate it and run Pluto.jl"
    Write-Host "    update  # Update dependencies [alias: up]"
    exit 0
}

switch -regex ($Task) {
    "^(up|update)$"  { Update }
    "^(fmt|format)$" { Format }
    "run"            { Run }
    default          { Default }
}
