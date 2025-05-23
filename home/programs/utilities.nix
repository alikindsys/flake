{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    btop
    fastfetch
    eza
    ripgrep
    jq
    flameshot
    nix-direnv
    direnv
    wget
    zip
    unzip
    coreutils
    xh
    fd
    fselect
    gnupg
    bat
    mpv
    piper
    screenkey
    kdePackages.qtstyleplugin-kvantum
  ];

  programs.zoxide = {
    enable = true;
    options = [ "--cmd cd" ];
  };
}
