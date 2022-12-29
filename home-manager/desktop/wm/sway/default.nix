{ config, pkgs, libs, ...}: {
    wayland.windowManager.sway = {
        enable = true;

        config = rec {
            modifier = "Mod4";
            terminal = "foot";
            menu = "wofi";

            startup = [
                { command = "mako"; }
                { command = "firefox"; }
            ];

            input = {
                "type:keyboard" = {
                    xkb_layout = "br";
                    xkb_model = "abnt2";
                };
            };

            gaps = {
                inner = 10;
                outer = 4;
                smartGaps = true;
            };

            colors = {
                focused = {
                    border = "#cba6f7";
                    background = "#cba6f7";
                    text = "#cba6f7";
                    indicator = "#cba6f7";
                    childBorder = "#cba6f7";
                };

                unfocused = {
                    border = "#1e1e2e";
                    background = "#1e1e2e";
                    text = "#1e1e2e";
                    indicator = "#1e1e2e";
                    childBorder = "#1e1e2e";
                };
            };
        };

        # configs for SwayFX
        # extraConfig = ''
        #     corner_radius 12
        # '';
    };
}