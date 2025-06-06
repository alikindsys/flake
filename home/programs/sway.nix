{ pkgs, lib, config, ...}:
let mod = "Mod4";
killExisting = p: "pgrep ${p} >/dev/null 2>&1 && kill \$(pgrep ${p})";
in {
  home.packages = with pkgs; [
    niri
    fuzzel
    mako
    waybar
  ];

  programs.waybar = {
    enable = true;
  };

  wayland.windowManager.sway = {
    enable = true;
    config = {
      terminal = "${pkgs.ghostty}";
      menu = "${pkgs.fuzzel}";

      modifier = mod;
      floating.modifier = "${mod} normal";

      keybindings = lib.attrsets.mergeAttrsList [
        {
          "${mod}+k" = "kill";
          "${mod}+x" = "exec ${killExisting "fuzzel"} || ${pkgs.fuzzel}";
          "${mod}+shift+q" = "exec swaynag -t warning -m \"Are you sure you want to exit sway?\" -B \"Yes, EXIT!\" \"swaymsg exit\"";
        }
        ];
      };
    };
}
