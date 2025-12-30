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
    qbittorrent
    krita
    aseprite
    drawio
    obsidian
    (blender.override {
      #cudaSupport=true;
    })
    penpot-desktop
    postman
    via
    audacity
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
    avalonia-ilspy
    zed-editor
    nixd
    github-cli
    pkg-config
    rustls-libssl
    jdk25_headless
    wev
    nmap
    alacritty
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
  ];
}
