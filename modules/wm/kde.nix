{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
  };
  
  xdg.portal = {
    enable = true;
  };

}
