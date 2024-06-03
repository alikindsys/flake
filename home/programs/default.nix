{ config, pkgs, ... }:

{
  imports = [
    ./other.nix    
    ./internet.nix
    ./utilities.nix
    ./games.nix
  ];
}
