
{ config, pkgs, ... }:{

  virtualisation.docker = {
    enable = true;

    daemon.settings = {
      dns = ["8.8.8.8" "8.8.4.4" "1.1.1.1"];
      dns-opts = ["use-vc"];
    };
  };

  imports = [
    ./hardware.nix
    ./packages.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "aluminium";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Vladivostok";

  services.displayManager.gdm.enable = true;

  i18n.defaultLocale = "en_US.UTF-8";

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users = {
    defaultUserShell = pkgs.fish;
    users.muri = {
      isNormalUser = true;
       description = "muri";
      extraGroups = ["networkmanager" "wheel" "docker"];
      shell = pkgs.fish;
    };
  };

  programs.firefox.enable = true;

  programs.fish.enable = true;

  nixpkgs.config.allowUnfree = true;
 
  programs.nix-ld.enable = true;

  programs.throne = {
      enable = true;
      tunMode.enable = true;
};

  nix.settings.experimental-features = ["nix-command" "flakes"];

  services.flatpak.enable = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services.openssh.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  }; 

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  system.stateVersion = "25.11"; # Did you read the comment?

 }
