{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];
    
  boot.initrd.luks.devices.luksroot = {
    device = "/dev/disk/by-label/cryptroot";
    preLVM = true;
    allowDiscards = true;
  };
  
  boot.supportedFilesystems = [ "btrfs" ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ] ++ config.boot.initrd.luks.cryptoModules;
  boot.initrd.kernelModules = [ "dm-snapshot" "amdgpu" ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-label/root";
      fsType = "btrfs";
      options = [ "subvol=root" "compress=zstd" "noatime" "ssd" "space_cache=v2" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-label/root";
      fsType = "btrfs";
      options = [ "subvol=home" "compress=zstd" "noatime" "ssd" "space_cache=v2" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-label/root";
      fsType = "btrfs";
      options = [ "subvol=nix" "compress=zstd" "noatime" "ssd" "space_cache=v2" ];
    };

  fileSystems."/var/log" =
    { device = "/dev/disk/by-label/root";
      fsType = "btrfs";
      options = [ "subvol=log" "compress=zstd" "noatime" "ssd" "space_cache=v2" ];
      neededForBoot = true;
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-label/boot";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-label/swap"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp3s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  # high-resolution display
  hardware.video.hidpi.enable = lib.mkDefault true;
}
