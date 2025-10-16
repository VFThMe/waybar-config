{ config, pkgs, ... }:

let
  hm = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  imports = [ "${hm}/nixos" ];

  home-manager.users.lim = { pkgs, ... }: {
    home.stateVersion = "23.05";

    home.enableNixpkgsReleaseCheck = false;

    home.packages = [
      pkgs.cowsay
      pkgs.pipes
      pkgs.clock-rs
      pkgs.fortune
    ];

 };
}

