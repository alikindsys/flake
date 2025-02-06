{ config, pkgs, ... }:

# Emacs Lush Theme
let lush = {
  background = "#202020";
  foreground = "#E0E0E0";
  turquoise = "#2AA198";
  orange = "#FF951B";
  pink = "#FF88FF";
  yellow = "#FFE329";
  green = "#61CE3C";
  light-blue = "#82A6DF";
  dark-blue = "#284050";
  light-red = "#FA583F";
  hl-line  = "#333333";
  modeline-bg = "#444444";
  modeline-fg = "#F0F0F0";
};
in
{
    home.file.".anvil/settings.toml".source = (pkgs.formats.toml {}).generate "settings.toml" {
      alias = {
        CFmt = "cargo fmt";
        CBuild = "cargo build";
        CTest = "cargo test -p $1 --all-features"; 
      };
      general = {
        exec = ["Tab '    '"]; 
      };
    }; 
      
    home.file.".anvil/style.js".source = (pkgs.formats.json {}).generate "style.js" {
      TagFgColor = lush.modeline-fg;
      TagBgColor = lush.modeline-bg;
      TagPathBasenameColor = lush.orange;
      BodyFgColor = lush.foreground;
      BodyBgColor = lush.background;
      LayoutBoxFgColor = lush.foreground;
      LayoutBoxUnsavedBgColor = lush.light-red;
      LayoutBoxBgColor = lush.modeline-bg;
      ScrollFgColor = lush.modeline-fg;
      ScrollBgColor = lush.modeline-bg;
      GutterWidth = 14;
      WinBorderColor = lush.modeline-bg;
      WinBorderWidth = 1;
      PrimarySelectionFgColor = "#75B7E6"; # Derived from Adobe Color. Contrast Ratio ~5 from BgColor.
      PrimarySelectionBgColor = lush.dark-blue;
      SecondarySelectionFgColor = "#3D1313"; # Derived from Adobe Color. Contrast Ratio ~5 from BgColor.
      SecondarySelectionBgColor = lush.light-red;
      ErrorsTagFgColor = "#F0D0D0"; 
      ErrorsTagBgColor = "#702020";
      ErrorsTagFlashFgColor = "#0F0E0E";
      ErrorsTagFlashBgColor = "#EB4444";
      TabStopInterval = 30;
      
      # Syntax Highlighting
      Syntax = {
        KeywordColor = lush.yellow;
        NameColor = lush.light-red;
        StringColor = lush.green;
        NumberColor = lush.orange;
        OperatorColor = lush.foreground;
        CommentColor = lush.turquoise;
        PreprocessorColorasd = "#708090"; # Emacs "SlateGray" # What?
        PreprocessorColor = "#7fffd4"; # Emacs "Aquamarine"
        HeadingColor = lush.orange;
        SubheadingColor = lush.orange;
        InsertedColor = lush.green;
        DeletedColor = lush.pink;
      };
    };
}

