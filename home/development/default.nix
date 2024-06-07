{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./jetbrains.nix
    ./languages.nix
  ];
}
