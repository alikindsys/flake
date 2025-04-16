{ pkgs, config, ...}:
{
  # Yay Typesetting!
  home.packages = with pkgs; [
    typst
    tinymist
  ];
}
