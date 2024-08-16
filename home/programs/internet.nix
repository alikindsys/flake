{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    firefox    
#   discord
    vesktop	
    psst
    thunderbird
    qbittorrent
  ];
}
