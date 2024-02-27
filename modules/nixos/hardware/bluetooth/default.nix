{ lib, config, ... }:

let
  cfg = config.mods.hardware.bluetooth;
in

with lib;

{
  options.mods.hardware.bluetooth = {
    enable = mkOption {
      default = false;
      example = true;
      type = types.bool;
      description = "Whether to configure bluetooth.";
    };
  };

  config = mkIf cfg.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings.General.Enable = "Source,Sink,Media,Socket";
    };

    environment.etc."wireplumber/bluetooth.lua.d/51-bluez-config.lua" = {
      inherit (config.services.pipewire.wireplumber) enable;

      text = ''
        		bluez_monitor.properties = {
        			["bluez5.enable-sbc-xq"] = true,
        			["bluez5.enable-msbc"] = true,
        			["bluez5.enable-hw-volume"] = true,
        			["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
        		}
        	'';
    };
  };
}
