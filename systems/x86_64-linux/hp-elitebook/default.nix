super: {
  imports = [ ./hardware-configuration.nix ];

  mods = {
    system = {
      enable = true;
      hostName = "hp-elitebook";
      boot.enable = true;
      fonts.enable = true;
      locale.enable = true;
      time.enable = true;
    };
    user.enable = true;
    hardware = {
      sound.enable = true;
      bluetooth.enable = true;
      networking.enable = true;
    };
    services = {
      printing.enable = true;
      flatpak.enable = true;
    };
    tools.ssh.enable = true;
    virt = {
      enable = true;
      podman.enable = true;
    };
    wm.hyprland.enable = true;
  };

  services.thermald.enable = true;
  powerManagement.powertop.enable = true;

  system.stateVersion = "23.11";
}
