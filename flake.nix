{
  description = "Flake containing templates for my projects.";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    git-hooks-nix.inputs.nixpkgs.follows = "nixpkgs";
    git-hooks-nix.url = "github:cachix/git-hooks.nix";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = args: import ./nix args;
}
