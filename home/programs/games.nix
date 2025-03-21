{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    prismlauncher
    bottles
    osu-lazer-bin
    # (pkgs.callPackage ../../pkgs/etterna/package.nix {})
    etterna 
    mangohud
  ];
}
