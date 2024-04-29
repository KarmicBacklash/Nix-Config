{
  config,
  pkgs,
  ...
}: {
  # X11 and Desktop Environment
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "karma";
  programs.kdeconnect.enable = true;
}
