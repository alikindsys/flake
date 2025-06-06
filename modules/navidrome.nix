{ pkgs, lib, outputs, ...}:
{
  services.navidrome = {
    enable = true;
    settings = {
      Address = "0.0.0.0";
      Port = 4533;
      EnableSharing = true;
      CoverJpegQuality = 100;
      EnableUserEditing = true;

      MusicFolder = "/home/alikindsys/Music";
    };
  };

  systemd.services.navidrome.serviceConfig = {
    ProtectHome = lib.mkForce false;
  };
}
