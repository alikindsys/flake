{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Rust
    rustup
    gcc
    cargo-bloat
    cargo-deny
    cargo-machete
  ];
}
