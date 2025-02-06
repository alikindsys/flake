{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    shellAliases = {
        glog = "git log --oneline --graph";
        gloga = "git log --oneline --graph --all";
        gss = "git status --short";
        ls = "eza";
        ll = "eza -l";
        rebuild = "sudo nixos-rebuild switch";
        cat = "bat";
    };

    zplug = {
        enable = true;
        plugins = [
        {
          name = "zdharma-continuum/fast-syntax-highlighting";
          tags = [as:plugin];
        }
        {
          name = "zsh-users/zsh-history-substring-search";
          tags = [as:plugin];
        }
        {
          name = "heapbytes/heapbytes-zsh";
          tags = [as:theme depth:1];
        }
        {
          name = "chisui/zsh-nix-shell";
          tags = [as:plugin];
        }
      ];};
      
      initExtra = ''
        bindkey "''${key[Up]}" up-line-or-search
        bindkey "^[[1;5C" forward-word
        bindkey "^[[1;5D" backward-word
        eval "$(direnv hook zsh)"
        zmodload zsh/zprof
      '';
  };
}
