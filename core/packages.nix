{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vim
    wget
    tmux
    screen
    fastfetch
    btop
    tree
    unzip
    git
    dmidecode
    #davinci-cracked
    #davinci-resolve
    fzf
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-color-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    nerd-fonts.jetbrains-mono
  ];

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-vkcapture
      #input-overlay
      #obs-backgroundremoval
      #obs-vaapi
      #obs-teleport
      #obs-source-clone
      obs-composite-blur
      obs-shaderfilter
      obs-pipewire-audio-capture
      #looking-glass-obs
    ];
    package = (pkgs.obs-studio.override {
        cudaSupport = true;
    });
  };
}
