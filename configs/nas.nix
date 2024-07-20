{ lib, config, pkgs, ... }:
let
  nasIp = "192.168.3.3";
  options = [ "x-systemd.automount" "noauto" "vers=3" "rw" ];
  cfg = config.sacmi5-cfg.nas;
in {
  options.sacmi5-cfg.nas = {
    enable = lib.mkEnableOption "Add mount points to Syno (NAS)";
  };

  config = lib.mkIf cfg.enable {
    fileSystems."/mnt/syno/shared" = {
      device = "${nasIp}:/volume1/Shared";
      fsType = "nfs";
      inherit options;
    };

    fileSystems."/mnt/syno/docker" = {
      device = "${nasIp}:/volume1/docker";
      fsType = "nfs";
      inherit options;
    };

    environment.systemPackages = [ pkgs.cifs-utils ];

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    programs.mtr.enable = true;
    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
