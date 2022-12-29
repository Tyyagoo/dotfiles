{ pkgs, ... }: {
  imports = [
    ./steam.nix
    # ./prism-launcher.nix -> wait for me
  ];
  home.packages = with pkgs; [ gamescope ];
}