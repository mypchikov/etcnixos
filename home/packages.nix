{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    appeditor
    telegram-desktop	
    (discord.override {
      withOpenASAR = false;
      withVencord = true;
    })
    obsidian
    via
    nautilus
    spotify
    vlc
    flameshot
    wireguard-tools

    # dev tools
    jetbrains-toolbox
    rustc
    cargo
    gcc
    nixd
    github-cli
    pkg-config
    rustls-libssl
    jdk25_headless
    wev
    nmap
    kitty
    scrcpy
    nodejs
    pnpm
    android-tools

    # minecraft
    prismlauncher
    glfw

    # games
    osu-lazer-bin

    # rice
    rofi
    waybar
    swaybg
    pywal
    imagemagick
    quickshell
    swaynotificationcenter
    starship
  ];
}
