{ pkgs, lib, config, ...}: {
    imports = [
        ./cli.nix
        ./git.nix
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