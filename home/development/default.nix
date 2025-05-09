{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./jj.nix
    ./jetbrains.nix
    ./languages.nix
    ./anvil.nix
  ];
}
