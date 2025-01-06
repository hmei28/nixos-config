{ config, pkgs, inputs, ... }:

{
  # inputs.catppuccin.hyprland.enable = true;
  # inputs.catppuccin.sddm.enable = true;
  # inputs.catppuccin.flavor = "mocha";
  wayland.windowManager.hyprland = {
    enable = true;

    extraConfig = "monitor=, preferred, auto, 1";

    settings = {
      "$mod" = "SUPER";

      general = {
        layout = "dwindle";
        gaps_in = 5;
        gaps_out = 5;
      }; 

      decoration = {
        dim_inactive = true;
        dim_strength = 0.35;
        rounding = 5;
      };

      bind =
        [
          "$mod, return, exec, kitty"
          "$mod, F, fullscreen"
          "$mod_SHIFT, B, exec, firefox"
          "$mod_SHIFT, F, fullscreen, 1"
          "$mod_SHIFT, O, exec, obsidian"
          "$mod_SHIFT, Q, killactive"
          # Mouse Focus
          "$mod, H, movefocus, l"
          "$mod, L, movefocus, r"
          "$mod, K, movefocus, u"
          "$mod, J, movefocus, d"
          # Window Management
          "$mod_SHIFT, H, movewindoworgroup, l"
          "$mod_SHIFT, L, movewindoworgroup, r"
          "$mod_SHIFT, K, movewindoworgroup, u"
          "$mod_SHIFT, J, movewindoworgroup, d"
          # Workspace Switcher
          "$mod, TAB, workspace, previous"
          "$mod, T, togglegroup"
          "$mod, C, changegroupactive, b"
          "$mod, V, changegroupactive, f"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
          builtins.concatLists (builtins.genList
            (
              x:
              let
                ws =
                  let
                    c = (x + 1) / 10;
                  in
                  builtins.toString (x + 1 - (c * 10));
              in
              [
                "$mod, ${ws}, workspace, ${toString (x + 1)}"
                "$mod_SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
              ]
            )
            10)
        );
    };
  };
} 