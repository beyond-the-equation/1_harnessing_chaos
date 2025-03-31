## 1. Installing Julia

- You can use a package manager of your choice or download the binaries directly
  from [https://julialang.org/downloads](https://julialang.org/downloads/).
- Another option is to use [juliaup](https://github.com/JuliaLang/juliaup/)
  (recommended), a version multiplexer for **Julia**.
- If you are using **NixOS**, like me, you might find that **Julia** (mostly
  **Pkg.jl**) doesn't play nicely. To address this, you could create a custom
  **FHS** environment specifically for **Julia**, or use a pre-built solution
  like [scientific-fhs](https://github.com/olynch/scientific-fhs).
  Alternatively, you can leverage
  [distrobox](https://github.com/89luca89/distrobox) (recommended) to install
  **Julia** or **juliaup** from the [AUR](https://aur.archlinux.org) or any
  other repository of your choice .

## 2. Configured Tasks

This project uses the [just](https://github.com/casey/just) task runner. Using
**just** is entirely optional but recommended. Tasks can be run using
`just <task_name>`.

- **default:** Alias for `just --list`. Lists all tasks.
- **run:** Activates the project, instantiates it and runs **Pluto.jl**.
- **update (up):** Update dependencies.
- **format (fmt):** Formats **Julia** files.

All of these tasks are defined in [Justfile](./Justfile).

## 3. Run: The manual way

```sh
❯ julia
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.11.4 (2025-03-10)
 _/ |\__'_|_|_|\__'_|  |
|__/                   |

julia> # Tap `]` to enter the package manager
(@v1.11) pkg> activate . # Activate the project
(HarnessingChaos) pkg> instantiate # Install the dependencies
(HarnessingChaos) pkg> # Tap `<bksp>` to exit the package manager
julia> using Pluto
julia> Pluto.run() # This should open a link in your default browser.
```

In the **Pluto.jl UI**, select the
[src/HarnessingChaosPluto.jl](src/HarnessingChaosPluto.jl) notebook to start
working with the interactive notebook.

Please note that the [src/HarnessingChaos.jl](src/HarnessingChaos.jl) file is
intentionally left as an empty module. This is to prevent **Julia** from raising
any precompilation errors.

## 4. Licensing

The code samples are licensed under the [MIT](./LICENSE-MIT) license, while the
materials are made available in the public domain under the
[CC0 1.0 Universal](./LICENSE-CC0) license.
