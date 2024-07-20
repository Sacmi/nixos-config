{ unstable, ... }:
let ollama-cuda = unstable.ollama.override { acceleration = "cuda"; };
in {
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
}
