{ config, pkgs, ... }:

{

  programs.git = {
    enable = true;
    userName = "alikindsys";
    userEmail = "alice@blocovermelho.org";
    aliases = {
      track = "add";
      untrack = "rm --cached";
      unstage = "reset HEAD -- ";
      reject = "restore --source=HEAD --staged --worktree -- ";
      discard = "restore -- ";
      staged = "diff --cached";
      unstaged = "diff";
      peek = "switch --detach";
      detach = "switch --detach HEAD^0";
      back = "switch \"-\"";
      unpulled = "range-diff @...@{u}";
      unpushed = "range-diff @{push}...@";
      trunklog = "log --oneline --graph --first-parent";
      branchlog = "!git log --oneline --graph $1^-";
    };
    signing = {
      key = "511CB44BC7522A89";
      signByDefault = true;
    };
    extraConfig = {
      rebase.missingCommitCheck = "error";
      rerere = {
        enabled = true;
        autoUpdate = true;
      };

    diff.algorithm = "patience";
    pull.ff = "only";
    merge = {
      ff = false;
      conflictStyle = "diff3";
    };
    commit = {
      verbose = true;
    };
    };
  };
}
