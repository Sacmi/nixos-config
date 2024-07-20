{ lib, ... }: {
  programs.chromium = {
    enable = lib.mkDefault true;

    extensions = [
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # uBlock Origin
      { id = "ammjkodgmmoknidbanneddgankgfejfh"; } # 7TV
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
      { id = "ponfpcnoihfmfllpaingbgckeeldkhle"; } # Enhancer for YouTube
      { id = "padekgcemlokbadohgkifijomclgjgif"; } # Proxy SwitchyOmega
      { id = "nffaoalbilbmmfgbnbgppjihopabppdk"; } # Video Speed Controller
      { id = "pncfbmialoiaghdehhbnbhkkgmjanfhe"; } # uBlacklist
    ];
  };
}
