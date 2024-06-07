{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    firefox    
    discord
    spotify
    thunderbird
    qbittorrent
  ];
}
