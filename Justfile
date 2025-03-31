default:
    @just --list

run:
    julia -e 'using Pkg; Pkg.activate("."); Pkg.instantiate(); using Pluto; Pluto.run();'

alias up := update
update:
    julia -e 'using Pkg; Pkg.activate("."); Pkg.update();'

alias fmt := format
format:
    julia -e 'using Pkg; Pkg.activate("."); Pkg.instantiate(); using JuliaFormatter; JuliaFormatter.format(".");'
