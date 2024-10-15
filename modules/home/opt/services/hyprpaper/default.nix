{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkIf mkEnableOption;

  cfg = config.opt.services.hyprpaper;
in
{
  options.opt.services.hyprpaper.enable = mkEnableOption "hypridle";

  config = mkIf cfg.enable {
    xdg.configFile."hypr/hyprpaper.conf".text = ''
      preload = ${config.wallpaper}
      wallpaper = , ${config.wallpaper}
    '';
  };
}
