{ pkgs, lib, config, ...}: {
    imports = [
        ./zsh.nix
    ];

    services = {
        gpg-agent = {
            enable = true;
            enableSshSupport = true;
        };
    };

    programs = {
        ssh.enable = true;
        gpg.enable = true;
    };
}