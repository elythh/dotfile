{ config, lib, pkgs, hyprland, colors, ... }:

{
  programs.waybar =
    with colors;{
      enable = true;
      # package = hyprland.packages.${pkgs.system}.waybar-hyprland;
      package = pkgs.waybar;
      systemd = {
        enable = true;
        target = "graphical-session.target";
      };
      style = ''
        * {
          border: none;
          border-radius: 0;
          font-family: JetbrainsMono Nerd Font, Sans;
          font-size: 18px;
          box-shadow: none;
          text-shadow: none;
          transition-duration: 0s;
        }

        window {
          color: rgba(35, 31, 32, 0.85);
          background: rgba(35, 31, 32, 0);
        }

        window#waybar.solo {
          background: rgb(217, 216, 216);
          color: rgba(32, 31, 35, 0.85);
          padding: 10px;
        }

        .modules-left,
        .modules-center,
        .modules-right {
          margin: 10px;
          margin-bottom: 0px;
        }

        .modules-right {
          padding: 5px 10px;
          margin: 5px 5px 0px 0px;
          border: 2px solid #eae9f0;
          box-shadow: #eae9f0 0px 0px 0px 0px;
          transition: 0.1s all ease;
          border-radius: 10px;
          color: #eae9f0;
          background-color: unset;
          border: 2px solid #eae9f0;
          box-shadow: #eae9f0 0px 5px 0px 0px;
          margin-top: 0px;
          margin-bottom: 5px;
          transition: 0.1s all ease;
          color: #eae9f0;
          opacity: 1;
          margin: 10px;
          margin-bottom: 5px;
          padding: 0px;
        }

        /* 
        CSS provided by Flick0
        more can be read here: https://github.com/Alexays/Waybar/wiki/Module:-Workspaces
        */
        #workspaces {
          min-height: 45px;
          font-size: 16px;
          margin-bottom: 0px;
          border-radius: 10px;
          transition: none;
          color: #eae9f0;
          margin-bottom: 0px;
        }

        #workspaces button {
          min-width: 40px;
          padding: 5px 10px;
          margin: 5px 5px 0px 0px;
          border: 2px solid #eae9f0;
          box-shadow: #eae9f0 0px 0px 0px 0px;
          transition: 0.1s all ease;
          border-radius: 10px;
          color: #eae9f0;
          background-color: unset;
          opacity: 0.7;
        }

        #workspaces button:hover {
          box-shadow: #eae9f0 0px 5px 0px 0px;
          margin-top: 0px;
          margin-bottom: 5px;
        }

        #workspaces button.active {
          padding: 5px 10px;
          margin: 5px 5px 0px 0px;
          border: 2px solid #eae9f0;
          box-shadow: #eae9f0 0px 0px 0px 0px;
          transition: 0.1s all ease;
          border-radius: 10px;
          color: #eae9f0;
          background-color: unset;
          border: 2px solid #eae9f0;
          box-shadow: #eae9f0 0px 5px 0px 0px;
          margin-top: 0px;
          margin-bottom: 5px;
          transition: 0.1s all ease;
          color: #eae9f0;
          opacity: 1;
        }

        #workspaces button.active:hover {
          transition: 0.04s all ease;
          margin-top: 2px;
          margin-bottom: 3px;
          box-shadow: #eae9f0 0px 3px 0px 0px;
        }

        /* #workspaces button.occupied {
          transition: none;
          color: #F28FAD;
          background: transparent;
          font-size: 4px;
        }

        #workspaces button.focused {
          color: #ABE9B3;
            border-top: 2px solid #ABE9B3;
            border-bottom: 2px solid #ABE9B3;
        }

        #workspaces button:hover {
          transition: none;
          box-shadow: inherit;
          text-shadow: inherit;
          color: #FAE3B0;
            border-color: #E8A2AF;
            color: #E8A2AF;
        }

        #workspaces button.focused:hover {
            color: #E8A2AF;
        } */
        #mode,
        #battery,
        #cpu,
        #bluetooth #memory,
        #network,
        #pulseaudio,
        #idle_inhibitor,
        #backlight,
        #custom-storage,
        #custom-terminal,
        #custom-spotify,
        #custom-weather,
        #custom-dunst,
        #custom-mail {
          margin: 5px 6px 0px 10px;
          padding-bottom: 3px;
        }

        #clock {
          margin: 0px 16px 0px 10px;
          font-weight: bold;
        }

        #network {
          padding-right: 5px;
        }

        #bluetooth {
          padding-right: 2px;
          padding-left: 8px;
          margin-top: 2px;
        }

        #battery.warning {
          color: #eae9f0;
        }

        #battery.critical {
          color: #eae9f0;
        }

        #battery.charging {
          color: #eae9f0;
        }

        #custom-storage.warning {
          color: #eae9f0;
        }

        #custom-storage.critical {
          color: #eae9f0;
        }

        #apatheia {
          color: #eae9f0;
        }

        #backlight {
          padding-right: 5px;
        }

        #custom-spotify {
          padding: 5px 10px;
          margin: 5px 5px 0px 0px;
          border: 2px solid #eae9f0;
          box-shadow: #eae9f0 0px 0px 0px 0px;
          transition: 0.1s all ease;
          border-radius: 10px;
          color: #eae9f0;
          background-color: unset;
          border: 2px solid #eae9f0;
          box-shadow: #eae9f0 0px 5px 0px 0px;
          margin-top: 0px;
          margin-bottom: 5px;
          transition: 0.1s all ease;
          color: #eae9f0;
          opacity: 1;
          padding-right: 15px;
        }

        #custom-appname {
          padding: 5px 10px;
          margin: 5px 5px 0px 0px;
          border: 2px solid #eae9f0;
          box-shadow: #eae9f0 0px 0px 0px 0px;
          transition: 0.1s all ease;
          border-radius: 10px;
          color: #eae9f0;
          background-color: unset;
          border: 2px solid #eae9f0;
          box-shadow: #eae9f0 0px 5px 0px 0px;
          margin-top: 0px;
          margin-bottom: 5px;
          transition: 0.1s all ease;
          color: #eae9f0;
          opacity: 1;
        }

        #tray {
          font-size: 5px;
          padding: 0px 10px;
          padding-right: 1px;
          border-radius: 5px 0px 0px 5px;
          background-color: rgba(17, 17, 27, 0);
        }
      '';
      settings = [{ }];
    };
}
