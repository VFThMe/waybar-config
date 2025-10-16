{ config, pkgs, ... }:

{
  services.xserver.videoDrivers = [ "amdgpu" ];

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      mesa
      vulkan-loader
      vulkan-tools
      vulkan-validation-layers
      vulkan-extension-layer
      libva
      libvdpau
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [
      mesa
      vulkan-loader
      libva
      libvdpau
    ];
  };

  hardware.cpu.amd.updateMicrocode = true;
  hardware.enableRedistributableFirmware = true;

  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    mangohud
    gamescope
    wineWowPackages.stagingFull
    winetricks
    vulkan-tools
    mesa-demos
  ];
}

