{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    alacritty
    tmux
    keepassxc
    zathura
    sublime-merge
    vscode
    typst
    gimp
    qbittorrent
    obsidian  
];
}
