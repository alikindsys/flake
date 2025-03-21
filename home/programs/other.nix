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
    libreoffice
    easyeffects
    aegisub
#    obs-studio
    nss
#    anvil-editor
    zed-editor
    quodlibet
    nicotine-plus
];
}
