{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.mods.wm.hyprland;
in

with lib;

{
  options.mods.wm.hyprland = {
    enable = mkOption {
      default = false;
      example = true;
      type = types.bool;
      description = "Whether to configure hyprland using home-manager.";
    };
    defaultTerminal = mkOption {
      default = "foot";
      example = literalExpression "wezterm";
      type = types.enum [
        "wezterm"
        "foot"
      ];
      description = "The terminal to use with hyprland.";
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      wl-clipboard
      cliphist
      networkmanagerapplet
      pavucontrol
      wofi
      brightnessctl
    ];

    programs.ags = {
      enable = true;
      extraPackages = with pkgs; [ brightnessctl ];
    };

    wayland.windowManager.hyprland = {
      enable = true;
      settings = import ./config.nix { inherit pkgs cfg; };
    };

    mods.apps.${cfg.defaultTerminal}.enable = true;
  };
}
