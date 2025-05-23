{ config, pkgs, ... }:

{
  imports = [ ./fish.nix ./zsh.nix ./starlight.nix ];

  programs.nix-your-shell.enable = true;
}
