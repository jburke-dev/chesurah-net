inputs:
let
  flakePart = inputs.flake-parts.lib.mkFlake { inherit inputs; } (
    { self, ... }:
    {
      imports = [
        inputs.git-hooks-nix.flakeModule
        ./devshell.nix
      ];
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
    }
  );
in
flakePart
