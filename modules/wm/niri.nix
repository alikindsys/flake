{ config, pkgs, ... }:

{
  # Notification Manager
  programs.mako.enable = true;
 
  programs.waybar = { 
   enable = true;
   settings = {
     mainbar.layer = "top";
     systemd.enable = true;
   };
  };
 
  # App Launcher
  programs.fuzzel.enable = true;

  # Niri
  programs.niri.enable = true;
}
