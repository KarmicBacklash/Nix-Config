{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./configurationStorageDevices.nix # Where the storage devices are configured
    ./configurationPackages.nix # Where all user packages are configured, Flatpak is also maintained here
    ./configurationShell.nix # ZSH, Shell, and Aliases
    ./desktopPlasma5.nix # Activates Plasma 5 + X11
    # ./desktopPlasma6.nix # Activates Plasma 6 + Wayland (Not yet made, will work on later)
  ];

  # General System Configuration
  networking.hostName = "KarmaPC";
  time.timeZone = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.UTF-8";

  # Linux Kernel
  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;

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

  # For Virtualization
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;


}
