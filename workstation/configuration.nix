{ pkgs, lib, ... }:

{
  imports = [
    ../configs/nix-gc.nix
    ../configs/audio.nix
    ../configs/locale.nix
    ../configs/users.nix
    ../configs/ld.nix
    ../configs/nas.nix

    ./hardware-configuration.nix
    ./gayvidia.nix
    ./plasma.nix
    ../bootloader/grub.nix
    # ../bootloader/systemd-boot.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # На этом ПК еще есть Windows - нужно добавить в GRUB
  boot.loader.grub.useOSProber = lib.mkForce true;

  networking.hostName = "workstation"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable CUPS to print documents.
  #services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  virtualisation.docker.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [ neovim wget git direnv nix-direnv ];

  fonts.packages = with pkgs; [ noto-fonts noto-fonts-cjk noto-fonts-emoji ];

  services.earlyoom.enable = true;

  sacmi5-cfg.nas.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 11434 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
