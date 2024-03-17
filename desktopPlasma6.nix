{
  config,
  pkgs,
  ...
}: {
  # Wayland and Plasma 6
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "karma";
  programs.kdeconnect.enable = true;
}
