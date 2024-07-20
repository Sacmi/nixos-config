{ pkgs, ... }: {
  home.packages = [ pkgs.remmina ];

  services.remmina.systemdService.enable = false;
}
