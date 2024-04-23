{
  config,
  pkgs,
  ...
}: {

services = {
    syncthing = {
        enable = true;
        user = "karma";
        dataDir = "/home/karma/Documents";    # Default folder for new synced folders
        configDir = "/home/karma/Documents/.config/syncthing";   # Folder for Syncthing's settings and keys

    };

};

# Syncthing ports: 8384 for remote access to GUI
# 22000 TCP and/or UDP for sync traffic
# 21027/UDP for discovery
# source: https://docs.syncthing.net/users/firewall.html
networking.firewall.allowedTCPPorts = [ 8384 22000 ];
networking.firewall.allowedUDPPorts = [ 22000 21027 ];

services.syncthing.settings.gui = {
    user = "karma";
    password = "mysyncthingpasswordiseasy";
};

}
