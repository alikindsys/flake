{ config, pkgs, ... }:

{
  # Notification Manager
  programs.mako.enable = true;
 
  # App Launcher
  programs.fuzzel.enable = true;
 
  services.gnome.gnome-keyring.enable = true;

  # Niri
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;  
  }; 
}
