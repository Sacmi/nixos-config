{ pkgs, fetchurl, ... }:
let
  # Костыль для свежих версий Яндекс.Браузера
  version = "24.4.1.951-1";
  yandex-browser-fresh = pkgs.yandex-browser.overrideAttrs (prev: {
    inherit version;
    src = fetchurl {
      url =
        "https://repo.yandex.ru/yandex-browser/deb/pool/main/y/yandex-browser-stable/yandex-browser-stable_${version}_amd64.deb";
      hash = "sha256-4AsMpANtMXUS2NCPKI+Ut0tWGurRIpWCmS3PhEi1CGo=";
    };
  });
in { home.packages = [ yandex-browser-fresh ]; }
