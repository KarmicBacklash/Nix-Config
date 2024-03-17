{
  config,
  pkgs,
  ...
}: {
  # Primary Storage Drive
  fileSystems."/run/media/karma/PrimaryStorage" = {
    device = "/dev/disk/by-uuid/e2d55701-0b45-45e6-adab-1da7fef02913";
    fsType = "ext4";
  };

  # Secondary Storage Drive
  fileSystems."/run/media/karma/SecondaryStorage" = {
    device = "/dev/disk/by-uuid/c5350fc2-cc29-4753-97ab-42ff7a2fa917";
    fsType = "ext4";
  };

  # Secondary Storage Drive
  fileSystems."/run/media/karma/TertiaryStorage" = {
    device = "/dev/disk/by-uuid/69283766-1ac4-40c8-8cd5-896ecb064bf8";
    fsType = "ext4";
  };
}
