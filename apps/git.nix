{ lib, ... }: {
  programs.git = {
    enable = lib.mkDefault true;
    userName = "Igor Anufriev";
    userEmail = "dev@sacmi5.ru";
    lfs.enable = lib.mkDefault true;
  };
}
