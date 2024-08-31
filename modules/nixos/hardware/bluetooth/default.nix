{
  config,
  lib,
  namespace,
  ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;

  cfg = config.${namespace}.hardware.bluetooth;
in
{
  options.${namespace}.hardware.bluetooth = {
    enable = mkBoolOpt false "Whether or not to enable support for extra bluetooth devices.";
  };

  config = mkIf cfg.enable {
    hardware.bluetooth = {
      enable = true;

      #package = pkgs.bluez-experimental;
      powerOnBoot = true;
    };

    services.blueman = {
      enable = true;
    };
  };
}
