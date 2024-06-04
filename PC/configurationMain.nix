{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./configurationStorageDevices.nix
    ./configurationPackages.nix
    ./configurationShell.nix
    ./configurationSyncthing.nix
    ./configurationVirtualisation.nix
    ./desktopPlasma5.nix
    # ./desktopPlasma6.nix
  ];

  # Allow Proprietary stuff
  nixpkgs.config.allowUnfree = true;

  # General System Configuration
  networking.hostName = "KarmaPC";
  time.timeZone = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.UTF-8";

  # swapDevices = [ {
  #   device = "/var/lib/swapfile";
  #   size = 48*1024;
  # } ];

  # Networking Configuration
  networking.networkmanager.enable = true;

  # Hardware Configuration
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.kernelModules = ["amdgpu"];
  services.xserver.videoDrivers = ["amdgpu"];
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;

  # Bluetooth Support
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  # Mullvad
  services.mullvad-vpn.enable = true;

  # Systemd-resolved - Added to fix whatever is wrong with mullvad
  networking.nameservers = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];

  services.resolved = {
    enable = true;
    dnssec = "true";
    domains = [ "~." ];
    fallbackDns = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];
    dnsovertls = "true";
  };

  # LD Fix
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
  ];

  # X11 Keymap Configuration
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  # Audio Configuration with Pipewire
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Gaming
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      gamescopeSession.enable = true;
    };
    gamemode.enable = true;
  };
}
