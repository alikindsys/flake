{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    wezterm    
    tmux
    keepassxc
  ];
}
