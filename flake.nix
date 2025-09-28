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
          targetPkgs = pkgs: [
            pkgs.just
            pkgs.julia
          ];
          runScript = "${pkgs.fish}/bin/fish";
        }).env;
    };
}
