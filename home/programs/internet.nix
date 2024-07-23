{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    firefox    
    discord
    psst
    thunderbird
    qbittorrent
  ];
}
