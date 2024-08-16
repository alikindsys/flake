{ pkgs, lib, outputs, ... }:

let username = "alikindsys";

in {

# Define a user account. 
users.users.alikindsys = {
  isNormalUser = true;
  description = "Alice Isabel";
  extraGroups = [ "networkmanager" "wheel" ];
  shell = pkgs.zsh;
};

# Add myself to the trusted users
nix.settings.trusted-users = [ username ];

nix.settings = {
  # Enable flakes globally.
  experimental-features = [ "nix-command" "flakes" ];
};

# Garbage collection settings
nix.gc = {
  automatic = lib.mkDefault true;
  dates = lib.mkDefault "weekly";
  options = lib.mkDefault "--delete-older-than 7d";
};

system.autoUpgrade = {
    enable = true;
    flake = "/etc/nixos";
    flags = [
      "--update-input"
      "nixpkgs"
      "--no-write-lock-file"
      "-L" # print build logs
    ];
    dates = "02:00";
    randomizedDelaySec = "45min";
};

# Allow unfree software
nixpkgs.config.allowUnfree = true;

# Audio
# sound.enable = true;
hardware.pulseaudio.enable = false;
security.polkit.enable = true;
services.pipewire = {
  enable = true;
  alsa = {
    enable = true;
    support32Bit = true;
  };
  pulse.enable = true;
  jack.enable = true;
};

services.power-profiles-daemon.enable = true;

fonts = {
  packages = with pkgs; [
    material-design-icons

    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji

    (nerdfonts.override { fonts = ["JetBrainsMono" "Iosevka" ]; })
  ];
};

environment.systemPackages = with pkgs; [
  neovim
  ripgrep
  fzf
  btop
  zsh
];

programs.zsh.enable = true;

}
