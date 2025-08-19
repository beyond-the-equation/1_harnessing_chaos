# WARN: Not portable outside NixOS based systems
# TODO: Make it portable
{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default =
        (pkgs.buildFHSEnv {
          name = "harnessing_chaos";
          LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
            pkgs.stdenv.cc.cc
            "/run/opengl-driver"
          ];
          targetPkgs = pkgs: [
            pkgs.just
            pkgs.julia
          ];
          runScript = "${pkgs.fish}/bin/fish";
        }).env;
    };
}
