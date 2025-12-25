{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    appeditor
    element-desktop
    telegram-desktop	
    wasistlos
    qbittorrent
    (vivaldi.override {
      proprietaryCodecs = true;
    })
    krita
    drawio
    obsidian
    (blender.override {
      #cudaSupport=true;
    })
    penpot-desktop
    postman
    via
    libreoffice-qt
    audacity
    nautilus
    vlc

    # dev tools
    jetbrains-toolbox
    rustc
    cargo
    gcc
    avalonia-ilspy
    beekeeper-studio
    zed-editor
    nixd
    github-cli
    pkg-config
    rustls-libssl
    jdk25_headless
    wev
    nmap
    scrcpy

    # minecraft shenanigans
    prismlauncher
    glfw
    
    # rice
    rofi
    waybar
    swaybg
    pywal16
  ];

  nixpkgs.overlays = [
    (self: super: {
      qt6Packages = super.qt6Packages.overrideScope (_: prev: {
        qt6gtk2 = prev.qt6gtk2.overrideAttrs (_: old: {
          version = "0.5-unstable-2025-03-04";
          src = self.fetchFromGitLab {
            domain = "opencode.net";
            owner  = "trialuser";
            repo   = "qt6gtk2";
            rev    = "d7c14bec2c7a3d2a37cde60ec059fc0ed4efee67";
            hash   = "sha256-6xD0lBiGWC3PXFyM2JW16/sDwicw4kWSCnjnNwUT4PI=";
          };
        });
      });
    })
    (self: super: {
      beekeeper-studio = super.beekeeper-studio.overrideAttrs (old: {
        buildInputs = (old.buildInputs or []) ++ [ pkgs.krb5 ];
        meta = old.meta // {
          knownVulnerabilities = [];
        };
      });
    })
  ];
}
