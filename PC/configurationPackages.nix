{
  config,
  pkgs,
  ...
}: {
  # System Packages
  environment.systemPackages = with pkgs; [
  ];

  # User Account and Installed Packages
  users.users.karma = {
    isNormalUser = true;
    description = "Karma";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
      alejandra
      appimage-run
      bottles
      btop
      cemu
      discord
      dolphin-emu
      filelight
      firefox
      fluent-reader
      gamemode
      gamescope
      gimp
      git
      godot_4
      gparted
      inkscape
      kate
      kdenlive
      krita
      libvirt
      lmms
      mangohud
      mc
      micro
      mullvad-vpn
      ntfs3g
      neofetch
      obs-studio
      openmw
      portmod
      qbittorrent
      qemu
      rclone
      syncthing
      teamviewer
      tenacity
      thefuck
      tldr
      virt-manager
      vlc
      vscodium
      wine-staging
      yakuake
      yt-dlp
      shipwright
    ];
  };

  # Flatpak
  services.flatpak.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
  xdg.portal.config.common.default = "gtk";
  # Currently installed flatpaks, for reference only
    # Flatseal
    # Obsidian
    # Only Office
    # Prism Launcher

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];
}
