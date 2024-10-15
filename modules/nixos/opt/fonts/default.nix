{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
{
  config = lib.mkIf config.fonts.enable {
    fonts.packages = with pkgs; [
      # icon fonts
      material-design-icons

      # normal fonts
      rubik
      lexend
      noto-fonts
      roboto
      inputs.apple-fonts.packages.${pkgs.system}.sf-pro-nerd

      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "FantasqueSansMono"
          "ZedMono"
          "Iosevka"
          "JetBrainsMono"
          "Monaspace"
        ];
      })
    ];
    fonts.fontconfig = {
      defaultFonts = {
        monospace = [
          "FiraCode Nerd Font Mono"
          "Noto Color Emoji"
        ];
        sansSerif = [
          "SFProDisplay Nerd Font"
          "Noto Color Emoji"
        ];
        serif = [
          "SFProDisplay Nerd Font"
          "Noto Color Emoji"
        ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
