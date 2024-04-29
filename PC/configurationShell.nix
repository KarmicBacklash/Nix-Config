{
  config,
  pkgs,
  ...
}: {

  # Shell and User Configuration
  users.defaultUserShell = pkgs.zsh;
  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      plugins = ["git" "man"];
      theme = "agnoster";
    };
    shellAliases = {
    };
  };
  
}
