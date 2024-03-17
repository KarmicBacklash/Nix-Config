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
      bitwarden
      bottles
      btop
      discord
      dolphin-emu
      filelight
      firefox
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
      mc
      micro
      mullvad-vpn
      ntfs3g
      obs-studio
      openmw
      portmod
      python3
      qbittorrent
      rclone
      ryujinx
      tenacity
      thefuck
      tldr
      vlc
      vscodium
      wine-staging
      yt-dlp
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
