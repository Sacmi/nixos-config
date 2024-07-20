{ unstable, config, lib, ... }:
let
  ollama-cuda = unstable.ollama.override { acceleration = "cuda"; };
  cfg = config.sacmi5-cfg.ai;
in {
  options.sacmi5-cfg.ai = { enable = lib.mkEnableOption "Install AI preset"; };

  config = lib.mkIf cfg.enable {
    home.packages = [ ollama-cuda ];

    systemd.user.services.ollama = {
      Unit = { Description = "Serve Ollama API"; };
      Install = { WantedBy = [ "default.target" ]; };
      Service = {
        ExecStart = "${ollama-cuda}/bin/ollama serve";
        Restart = "always";
        Environment = "OLLAMA_HOST=0.0.0.0:11434";
      };
    };
  };
}
