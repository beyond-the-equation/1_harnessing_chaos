[doc("Alias for `just --list`. List all tasks")]
default:
    @just --list

[doc("Activate the project, instantiate it and run Pluto.jl")]
run:
    julia -e 'using Pkg; Pkg.activate("."); Pkg.instantiate(); using Pluto; Pluto.run();'

alias up := update
[doc("Update dependencies")]
update:
    julia -e 'using Pkg; Pkg.activate("."); Pkg.update();'

alias fmt := format
[doc("Format Julia files")]
format:
    julia -e 'using Pkg; Pkg.activate("."); Pkg.instantiate(); using JuliaFormatter; JuliaFormatter.format(".");'
