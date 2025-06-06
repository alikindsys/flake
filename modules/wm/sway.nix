{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mako
    grim
    slurp
    wl-clipboard
    wofi
    waybar
    networkmanagerapplet
  ];
 
  services.gnome.gnome-keyring.enable = true;

  # Sway
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;  
  };
}
