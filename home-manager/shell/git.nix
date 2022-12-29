{ config, pkgs, lib, ...}: {
    programs.git = {
        enable = true;
        lfs.enable = true;
        userName = "Tyyagoo";
        userEmail = "tyyago.dev@gmail.com";
        signing = {
          signByDefault = true;
          key = "D12808250532E16B";
        };
    };
}