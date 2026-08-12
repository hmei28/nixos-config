{ config, pkgs, inputs, lib, ... }:
let
  keys = [ "ampersand" "eacute" "quotedbl" "apostrophe" "parenleft" "minus" "egrave" "underscore" "ccedilla" "agrave" ];
  
  workspaceBinds = lib.concatStrings (
    builtins.genList (x:
      let ws = toString (x + 1); k = builtins.elemAt keys x; in ''
        hl.bind("SUPER + ${k}", hl.dsp.focus({ workspace = ${ws} }))
        hl.bind("SUPER + SHIFT + ${k}", hl.dsp.window.move({ workspace = ${ws} }))
      ''
    ) 10
  );
in
{
  config = lib.mkIf (config.desktop == "hyprland") {
    wayland.windowManager.hyprland = {
      enable = true;
      configType = "lua";
      systemd.enable = false;

      extraLuaFiles = {
        "00-env" = ''
          hl.env("QT_QPA_PLATFORM", "wayland")
          hl.env("QT_QPA_PLATFORMTHEME", "gtk3")
          hl.env("QT_QPA_PLATFORMTHEME_QT6", "gtk3")
          hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

          hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")
          hl.env("XCURSOR_SIZE", "26")
          hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice")
          hl.env("HYPRCURSOR_SIZE", "24")
        '';

        "01-config" = ''
          hl.config({
              misc = {
                  disable_hyprland_logo = true,
                  disable_splash_rendering = true
              },
              input = {
                  kb_layout = "fr",
                  follow_mouse = 1,
                  touchpad = { natural_scroll = true }
              },
              general = {
                  gaps_in = 5,
                  gaps_out = 5,
                  border_size = 0,
          
                  col = {
                      active_border = "rgba(707070ff)",
                      inactive_border = "rgba(d0d0d0ff)"
                  },
                  layout = "dwindle",
              },
              decoration = {
                  rounding = 12,
          
                  active_opacity = 0.9,
                  inactive_opacity = 0.7,
                  fullscreen_opacity = 0.9,

                  shadow = {
                      enabled = true,
                      range = 30,
                      render_power = 4,
                      offset = {0, 5},
                      color = "rgba(00000070)"
                  }
              },
              animations = {
                  enabled = true,
              }
          })
          hl.curve("easeOutQuint", { type = "bezier", points = { {0.23, 1}, {0.32, 1} } })
          hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 8, bezier = "easeOutQuint", style = "slidevert" })
        '';

        "02-windowrules" = ''
	  hl.layer_rule({ match = { namespace = "dms" }, no_anim = true })
          hl.window_rule({ match = { class = "^(blueman-manager)$" }, float = true })
	  hl.window_rule({ match = { class = "^(org\\.gnome\\.)" }, border_size = 0, rounding = 12 })
	  -- Floating windows
          hl.window_rule({ match = { class = "^(yazi)$" }, float = true, size = "50% 30%", center = true, workspace = "special:yazi silent" })
          hl.window_rule({ match = { class = "^(com.danklinux.dms)$" }, float = true })
          hl.window_rule({ match = { class = "^(org\\.gnome\\.Nautilus)$" }, float = true, workspace = "special:nautilus silent" })
	  hl.window_rule({ match = { class = "^(kitty)$" }, border_size = 1 })

        '';

        "03-binds" = ''
            -- mouse move/resize : dispatcher + option "mouse" sur le bind, pas mouse:272/273 comme keysym
            hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
            hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
            
            hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("dms ipc call audio increment 3"), { repeating = true, locked = true })
            hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("dms ipc call audio decrement 3"), { repeating = true, locked = true })
            hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("dms ipc call brightness increment 5 backlight:amdgpu_bl1"), { repeating = true, locked = true })
            hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("dms ipc call brightness decrement 5 backlight:amdgpu_bl1"), { repeating = true, locked = true })
            hl.bind("XF86AudioMute", hl.dsp.exec_cmd("dms ipc call audio mute"), { locked = true })
            hl.bind("SUPER + SHIFT + M", hl.dsp.exec_cmd("nwg-displays"))
            
            hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("kitty"))
            hl.bind("SUPER + F", hl.dsp.window.fullscreen())
            hl.bind("SUPER + A", hl.dsp.exec_cmd("zen-twilight"))
            hl.bind("SUPER + SHIFT + F", hl.dsp.window.fullscreen(1))
            hl.bind("SUPER + SHIFT + O", hl.dsp.exec_cmd("dms ipc call notepad toggle"))
            hl.bind("SUPER + SHIFT + Q", hl.dsp.window.close())
            hl.bind("CTRL + SHIFT + Q", hl.dsp.window.close())
            hl.bind("CTRL + ALT + L", hl.dsp.exec_cmd("dms ipc call lock lock"))
            hl.bind("CTRL + ALT + P", hl.dsp.exec_cmd("dms ipc call theme toggle"))
            hl.bind("CTRL + ALT + DELETE", hl.dsp.exec_cmd("dms ipc call powermenu toggle"))
            hl.bind("SUPER + space", hl.dsp.exec_cmd("dms ipc call spotlight toggle"))
            hl.bind("SUPER + B", hl.dsp.exec_cmd("dms ipc call hypr toggleBinds"))
            hl.bind("SUPER + I", hl.dsp.exec_cmd("dms ipc call plugins toggle aiAssistant"))
            hl.bind("SUPER + V", hl.dsp.exec_cmd("dms ipc call clipboard toggle"))
            hl.bind("SUPER + comma", hl.dsp.exec_cmd("dms ipc call settings focusOrToggle"))
            -- hl.bind("SUPER + E", hl.dsp.exec_cmd("EDITOR=nvim kitty --class yazi --execute yazi"))
	    -- Toggle Yazi as a scratchpad on a special workspace, preserving its state
	    hl.bind("SUPER + E", function()
	        local yazi_open = false
	        for _, w in pairs(hl.get_windows()) do
	            if w.class == "yazi" then
	                yazi_open = true
	            end
	        end
	        if yazi_open then
	            hl.dispatch(hl.dsp.workspace.toggle_special("yazi"))
	        else
	            hl.dispatch(hl.dsp.exec_cmd("EDITOR=nvim kitty --class yazi --execute yazi"))
	            hl.dispatch(hl.dsp.workspace.toggle_special("yazi"))
	        end
	    end)
	    -- Toggle Nautilus as a scratchpad on a special workspace, preserving its state
	    hl.bind("SUPER + SHIFT + E", function()
	        local nautilus_open = false
	        for _, w in pairs(hl.get_windows()) do
	            if w.class == "org.gnome.Nautilus" then
	                nautilus_open = true
	            end
	        end
	        if nautilus_open then
	            hl.dispatch(hl.dsp.workspace.toggle_special("nautilus"))
	        else
	            hl.dispatch(hl.dsp.exec_cmd("nautilus"))
	            hl.dispatch(hl.dsp.workspace.toggle_special("nautilus"))
	        end
	    end)
            hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("dms screenshot region"))
            
            -- Focus : hl.dsp.focus({ direction = ... }) -- mots complets, pas l/r/u/d
            hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
            hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))
            hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
            hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))
            
            -- Move active window : hl.dsp.window.move({ direction = ... })
            hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
            hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
            hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
            hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
            
            hl.bind("ALT + TAB", hl.dsp.window.cycle_next())
            hl.bind("ALT + SHIFT + TAB", hl.dsp.window.cycle_next())
            hl.bind("SUPER + TAB", hl.dsp.focus({ workspace = "previous" }))
            hl.bind("SUPER + SHIFT + TAB", hl.dsp.focus({ workspace = "next" }))
            hl.bind("SUPER + T", hl.dsp.group.toggle())
            hl.bind("SUPER + C", hl.dsp.group.prev())
            hl.bind("SUPER + G", hl.dsp.group.next())

            -- Gestures : swipe 3 doigts pour changer de workspace
            hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
            
            -- Workspaces AZERTY : hl.dsp.focus({workspace=i}) + hl.dsp.window.move({workspace=i})
	    ${workspaceBinds}

        '';
        "04-dms-require" = ''
          require("dms.colors")
          require("dms.layout")
          require("dms.windowrules")
          require("dms.outputs")
        '';
      };
    };
  };
}
