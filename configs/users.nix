{ ... }: {
  users.users.sacmi5 = {
    isNormalUser = true;
    description = "Igor Anufriev";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };
}
