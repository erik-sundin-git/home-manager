{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  # Shorter name to access final settings a
  # user of hello.nix module HAS ACTUALLY SET.
  # cfg is a typical convention.
  cfg = config.programs.qtile;
in {
  imports = [
    # Paths to other modules.
    # Compose this module out of smaller ones.
  ];

  options.programs.qtile = {
    enable = mkEnableOption "Qtile - the tiling window manager";

    package = mkOption {
      type = types.package;
      default = pkgs.qtile;
      description = "The Qtile package to use.";
    };
  };

  config = mkIf cfg.enable {
    home.packages = [cfg.package];
  };
}
