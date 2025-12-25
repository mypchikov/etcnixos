{ pkgs, ...}: {
  imports = [
   # ./theme.nix
    ./bundle.nix
    ./packages.nix
  ];

  home = {

    username = "muri";
    homeDirectory = "/home/muri";

    stateVersion = "25.11";

    sessionPath = [
        "/home/muri/Development/Apps"
    ];
  };

  programs.home-manager.enable = true;
}
