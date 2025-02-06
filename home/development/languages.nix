{ config, pkgs, ... }:

{
  imports = [ ./lang/rust.nix ];

  home.packages = with pkgs; [
    # Rust
    rustup
    # gcc
    cargo-bloat
    cargo-deny
    cargo-machete
    # Java
    jdk21
  ];
}
