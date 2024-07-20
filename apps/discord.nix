{ unstable, ... }: {
  home.packages = [
    (unstable.discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
  ];
}
