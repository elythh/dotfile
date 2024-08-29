{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt enabled;

  cfg = config.${namespace}.suites.games;
in
{
  options.${namespace}.suites.games = {
    enable = mkBoolOpt false "Whether or not to enable common games configuration.";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      bottles
      heroic
      lutris
      prismlauncher
      proton-caller
      protontricks
      protonup-ng
      protonup-qt
    ];

    elyth = {
      programs = {
        terminal = {
          tools = {
            wine = enabled;
          };
        };
      };
    };
  };
}
