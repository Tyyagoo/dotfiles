{ config, pkgs, lib, ... }: {
    home.packages = with pkgs; [
        catimg
        duf
        fd
        file
        joshuto
        ripgrep
        yt-dlp
    ];

    programs = {
        bat.enable = true;

        exa = {
            enable = true;
            enableAliases = true;
        };
    };
}