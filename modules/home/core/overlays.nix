{ inputs, ... }:
{
  nixpkgs.overlays = [
    inputs.nur.overlay
    (_: prev: { zjstatus = inputs.zjstatus.packages.${prev.system}.default; })
    inputs.hyprpanel.overlay
  ];
}
