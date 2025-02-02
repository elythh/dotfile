{ config, lib, ... }:
{
  imports = [ ./run-as-service.nix ];

  config = lib.mkIf config.modules.zsh.enable {
    sops.secrets."env.zsh" = {
      path = "${config.home.homeDirectory}/.config/zsh/env.zsh";
    };
    programs.zsh = {
      enable = true;
      dotDir = ".config/zsh";
      envExtra = ''
        export PATH=~/.local/bin:~/.local/share/nvim/mason/bin:$PATH
      '';
      initExtra = ''
        source ~/.config/zsh/env.zsh
        source ~/.config/zsh/aliases.zsh
        source ~/.config/zsh/options.zsh
        source ~/.config/zsh/plugins.zsh
        source ~/.config/zsh/utility.zsh
        source ~/.config/zsh/keybinds.zsh
      '';
    };
    programs.atuin = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
      settings = {
        style = "compact";
        show_tabs = false;
        show_help = false;
        enter_accept = true;
      };
    };
    home.file.kubie = {
      target = ".kube/kubie.yaml";
      text = ''
        prompt:
          disable: true
      '';
    };
  };
}
