{ unstable, pkgs, lib, ... }: {
  programs.vscode = {
    enable = lib.mkDefault true;
    extensions = with unstable.vscode-extensions;
      [
        ms-azuretools.vscode-docker
        ms-vscode-remote.remote-ssh
        mkhl.direnv
        usernamehw.errorlens
        eamodio.gitlens
        rust-lang.rust-analyzer
        serayuzgur.crates
        ms-vscode.cmake-tools
        ms-vscode.cpptools
        llvm-vs-code-extensions.vscode-clangd
        jnoortheen.nix-ide
        continue.continue
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "better-comments";
          publisher = "aaron-bond";
          version = "3.0.2";
          sha256 = "hQmA8PWjf2Nd60v5EAuqqD8LIEu7slrNs8luc3ePgZc=";
        }
        {
          name = "vscode-jetbrains-icon-theme";
          publisher = "chadalen";
          version = "2.18.0";
          sha256 = "l7gIYYAboJJZN3HkKfxBB2CDFxw5UYMRRZtWh6Kkn2M=";
        }
      ];
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    userSettings = {
      "editor.fontFamily" = "'JetBrainsMono Nerd Font', 'monospace', monospace";
      "editor.fontSize" = 18;
      "editor.fontLigatures" = true;
      "telemetry.telemetryLevel" = "off";
      "[nixos]" = { "editor.tabSize" = 2; };
      "extensions.autoUpdate" = false;
      "workbench.iconTheme" = "vscode-jetbrains-icon-theme-2023-dark";
      "nix.enableLanguageServer" = true;
      "nix.formatterPath" = "nixfmt";
      "nix.serverPath" = "nixd";
      "cmake.pinnedCommands" = [
        "workbench.action.tasks.configureTaskRunner"
        "workbench.action.tasks.runTask"
      ];
    };
  };
}
