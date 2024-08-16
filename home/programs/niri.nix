{ pkgs, lib, config, ...}:
{
    home.packages = with pkgs; [
       niri
       fuzzel
       mako
       waybar
    ];

    programs.niri.settings = {

    };

}
