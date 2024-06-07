{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Rust
    rustup
  ];
}
