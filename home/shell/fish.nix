{ config, pkgs, ... }:

{
  programs.fish = {
    shellAliases = {
        glog = "git log --oneline --graph";
        gloga = "git log --oneline --graph --all";
        gss = "git status --short";
        ls = "eza";
        ll = "eza -l";
        rebuild = "sudo nixos-rebuild switch";
        cat = "bat";
    };
  };

  programs.direnv.enableFishIntegration = true;
  programs.starship.enableFishIntegration = true;
  programs.zoxide.enableFishIntegration = true;
 
}
