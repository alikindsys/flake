{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    prismlauncher    
    bottles
    osu-lazer-bin
  ];
}
