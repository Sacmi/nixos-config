{ lib, ... }: {
  nix.settings.auto-optimise-store = lib.mkDefault true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
}
