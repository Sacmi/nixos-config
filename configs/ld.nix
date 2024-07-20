{ pkgs, lib, ... }: {
  programs.nix-ld = {
    enable = lib.mkDefault true;
    package = pkgs.nix-ld-rs;
  };
}
