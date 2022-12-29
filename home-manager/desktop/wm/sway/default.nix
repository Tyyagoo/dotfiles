{ config, pkgs, libs, ...}: {
    wayland.windowManager.sway = {
        enable = true;
        config = rec {
            modifier = "Mod4";
            terminal = "foot";
            menu = "wofi";

            startup = [
                { command = "firefox"; }
            ];

            input = {
                "type:keyboard" = {
                    xkb_layout = "br";
                    xkb_model = "abnt2";
                };
            };
        };
    };
}