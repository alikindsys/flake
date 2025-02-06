{ config, pkgs, ... }:

{
  imports = [
    ../../modules/system.nix
    ./hardware-configuration.nix

    # The window manager
    # Currently: KDE
    ../../modules/wm/kde.nix
    # ../../home/programs/niri.nix
  ];

  # On this house we use sddm
  services.displayManager.sddm = {
    enable = true;
    wayland = {
      enable = true;
      compositor = "kwin";
    };
  };

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #REISUB
  boot.kernel.sysctl."kernel.sysrq" = 502;

  # ZRam
  zramSwap.enable = true;

  # Swap File
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 8 * 1024;
    }
  ];

  # Networking
  networking.hostName = "ideapad-s145";
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [ 21 ];
  networking.firewall.allowedTCPPortRanges = [ { from = 51000; to = 51999; } ];

  # FTP
  services.vsftpd = {
    enable = true;
    anonymousUser = true;
    anonymousUserHome = "/home/alikindsys/Downloads/[Anime Time] Rebuild of Evangelion (Movies) [1.11+2.22+3.33+3.0-1.11] [Dual Audio][1080p][HEVC 10bit x265][AAC][Multi Sub] (Evangelion Movies) [Batch]";
    anonymousUserNoPassword = true;
    extraConfig = ''
      pasv_enable=Yes
      pasv_min_port=51000
      pasv_max_port=51999
    '';
  };

  # Timezone and Locale
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Timezone
  time.timeZone = "America/Sao_Paulo";

  # Steam
  programs.steam.enable = true;

  # Wine
  environment.systemPackages = with pkgs; [
    wineWowPackages.stable
    aspell
    aspellDicts.pt_BR
    aspellDicts.en
    aspellDicts.en-computers
  ];

  # Keymaps
  services.xserver.xkb = {
    layout = "br";
    variant = "";
  };

  # Emacs Daemons
  services.emacs = {
    enable = true;
    package = pkgs.emacs-gtk;
  };

  services.tailscale.enable = true;

  services.openssh.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # SSD TRIM Support
  services.fstrim.enable = true;

  services.ratbagd.enable = true;

  console.keyMap = "br-abnt2";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
