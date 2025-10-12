#!/usr/bin/env bash

# Activate the project, instantiate it and run Pluto.jl
run() {
    julia -e 'using Pkg; Pkg.activate("."); Pkg.instantiate(); using Pluto; Pluto.run();'
}

# Update dependencies
update() {
    julia -e 'using Pkg; Pkg.activate("."); Pkg.update();'
}

# Format Julia files
format() {
    julia -e 'using Pkg; Pkg.activate("."); Pkg.instantiate(); using JuliaFormatter; JuliaFormatter.format(".");'
}

# The default task
default() {
    echo "Usage: ./$(basename "$0") [<task>]"
    echo "Available tasks:"
    echo "    format  # Format Julia files [alias: fmt]"
    echo "    run     # Activate the project, instantiate it and run Pluto.jl"
    echo "    update  # Update dependencies [alias: up]"
    exit 0
}

case "$1" in
    run)          run ;;
    up | update)  update ;;
    fmt | format) format ;;
    *)            default ;;
esac
