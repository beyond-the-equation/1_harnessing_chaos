## 1. Installing Julia

- You can use a package manager of your choice or download the binaries directly
  from [https://julialang.org/downloads](https://julialang.org/downloads).
- Another option is to use [juliaup](https://github.com/JuliaLang/juliaup)
  (recommended), a version multiplexer for **Julia**.
- If you are using **NixOS** like me, you might find that **Julia** (mostly
  **Pkg.jl**) doesn't play nicely. To address this, you can create a custom
  **FHS** environment specifically for **Julia**, or use a pre-built solution
  like [scientific-fhs](https://github.com/olynch/scientific-fhs).
  Alternatively, you can leverage
  [distrobox](https://github.com/89luca89/distrobox) (recommended) to install
  **Julia** or **juliaup** from the [AUR](https://aur.archlinux.org) or any
  other repository of your choice.

## 2. Configured Tasks

This project contains two script files: [run.sh](/run.sh) (for Linux/macOS) and
[Run.ps1](/Run.ps1) (for Windows).

- **Linux/macOS users** can execute tasks with `./run.sh [<task>]`.
- **Windows users** should use `.\Run.ps1 [<task>]`.

The tasks should be executed inside the project directory.

> [!note]
>
> If you encounter a permission error when running scripts in PowerShell, you
> may need to adjust the execution policy:
>
> ```pwsh
> Set-ExecutionPolicy Unrestricted
> ```
>
> Be cautious when using this, as it grants unrestricted script execution
> (shouldn't be an issue if you don't run random scripts on your machine without
> reading the content first :D).

The available tasks are:

- **run:** Activate the project, instantiate it and run **Pluto.jl**.
- **update (up):** Update dependencies.
- **format (fmt):** Format **Julia** files.

## 3. Run things the manual way

```sh
❯ julia
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.12.0 (2025-10-07)
 _/ |\__'_|_|_|\__'_|  |
|__/                   |

julia> # Tap `]` to enter the package manager
(@v1.11) pkg> activate . # Activate the project
(HarnessingChaos) pkg> instantiate # Install the dependencies
(HarnessingChaos) pkg> # Tap `<bksp>` or `<backspace>` to exit the package manager
julia> using Pluto; Pluto.run() # This should open a link in your default browser
```

## 4. Opening the notebook

In the **Pluto.jl UI**, select the
[src/HarnessingChaosPluto.jl](./src/HarnessingChaosPluto.jl) notebook to start
working with the interactive notebook.

> [!note]
>
> The [src/HarnessingChaos.jl](./src/HarnessingChaos.jl) file is intentionally
> an empty module. This prevents **Julia** from raising any precompilation
> errors.

## 5. Licensing

The code samples are licensed under the [MIT](./LICENSE-MIT) license, while the
materials are made available in the public domain under the
[CC0 1.0 Universal](./LICENSE-CC0) license.
