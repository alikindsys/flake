{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ghostty
    tmux
    keepassxc
    zathura
    sublime-merge
    vscode
#    typst
    gimp
    qbittorrent
#    obsidian  
    libreoffice
    easyeffects
#    aegisub
#    obs-studio
    nss
#    anvil-editor
#    zed-editor
    nh
    nixfmt-rfc-style
    quodlibet-full
    nicotine-plus
];
}
