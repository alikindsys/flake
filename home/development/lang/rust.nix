{ pkgs, config, ...}:
{
  # Since Rust-lang takes a *while* to compile on my computer (and honestly I think there's nothing wrong with my computer)
  # We've made a special land just for making rust work better:tm:

  home.packages = with pkgs; [
    # Faster Linker
    clang
    mold
    # Compilation Cache
    sccache
  ];

  ## Configuring rust to use those packages
  home.file.".cargo/config.toml".source = (pkgs.formats.toml {}).generate "config.toml" {
      "target.x86_64-unknown-linux-gnu" = {
        linker = "${pkgs.clang}/bin/clang";
        rustflags = ["-C" "link-arg=fuse-ld=${pkgs.mold}/bin/mold"];
      };

      "env" = {
        RUSTC_WRAPPER = "${pkgs.sccache}/bin/sccache";
      };
  };
}
