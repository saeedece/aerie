{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.isDesktop {

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  home-manager.sharedModules = [
    {
      home.packages = with pkgs; [
        grim
        hyprpolkitagent
      ];
      home.sessionVariables.NIXOS_OZONE_WL = "1";

      wayland.windowManager.hyprland = {
        enable = true;
        settings = {
          "$mod" = "SUPER";
          exec-once = [
            "systemctl --user start hyprpolkitagent"
            "thunar --daemon"
            "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
            "dunst"
            "waybar"
          ];

          monitor = [
            "HDMI-A-1,1920x1080,0x0,1"
            "Unknown-1,disable"
          ];

          env = [
            "XCURSOR_SIZE,18"
            "LIBVA_DRIVER_NAME,nvidia"
            "XDG_SESSION_TYPE,wayland"
            "GBM_BACKEND,nvidia_drm"
            "__GLX_VENDOR_LIBRARY_NAME,nvidia"
          ];

          bind = [
            "$mod, Q, exec, ghostty"
            "$mod, R, exec, bemenu-run"
            "$mod, E, exec, thunar"
            "$mod, C, killactive,"
            "$mod, M, exit,"
            "$mod, G, togglegroup,"
            "$mod, H, moveoutofgroup,"
            "$mod, F, changegroupactive, f"
            "$mod, B, changegroupactive, b"
            "$mod, 1, workspace, 1"
            "$mod, 2, workspace, 2"
            "$mod, 3, workspace, 3"
            "$mod, 4, workspace, 4"
            "$mod, 5, workspace, 5"
            "$mod, 6, workspace, 6"
            "$mod, 7, workspace, 7"
            "$mod, 8, workspace, 8"
            "$mod, 9, workspace, 9"
            "$mod, 0, workspace, 10"
            "$mod SHIFT, 1, movetoworkspace, 1"
            "$mod SHIFT, 2, movetoworkspace, 2"
            "$mod SHIFT, 3, movetoworkspace, 3"
            "$mod SHIFT, 4, movetoworkspace, 4"
            "$mod SHIFT, 5, movetoworkspace, 5"
            "$mod SHIFT, 6, movetoworkspace, 6"
            "$mod SHIFT, 7, movetoworkspace, 7"
            "$mod SHIFT, 8, movetoworkspace, 8"
            "$mod SHIFT, 9, movetoworkspace, 9"
            "$mod SHIFT, 0, movetoworkspace, 10"
            ", Print, exec, grim ~/media/pictures/screenshots/$(date +'%s_grim.png')"
            "$mod SHIFT, H, movefocus, l"
            "$mod SHIFT, L, movefocus, r"
            "$mod SHIFT, K, movefocus, u"
            "$mod SHIFT, J, movefocus, d"
          ];

          bindm = [
            "$mod, mouse:272, movewindow"
            "$mod, mouse:273, resizewindow2"
          ];

          general = {
            gaps_in = 0;
            gaps_out = 0;
            "col.active_border" = "rgba(00000000)";
            "col.inactive_border" = "rgba(000000ff)";
            no_focus_fallback = true;
            allow_tearing = false;
          };

          decoration = {
            rounding = 0;
            blur = {
              enabled = true;
              size = 1;
              passes = 4;
              ignore_opacity = true;
              new_optimizations = true;
            };
          };

          animations = {
            enabled = "yes";
            bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
            animation = [
              "windows, 1, 7, myBezier"
              "windowsOut, 1, 7, default, popin 80%"
              "border, 1, 10, default"
              "borderangle, 1, 8, default"
              "fade, 1, 7, default"
              "workspaces, 1, 6, default"
            ];
          };

          dwindle = {
            pseudotile = "yes";
            preserve_split = "yes";
          };

          cursor.no_hardware_cursors = true;
          master.new_status = "master";
          gestures.workspace_swipe = "off";
          misc.disable_hyprland_logo = true;

          device = {
            name = "epic-mouse-v1";
            sensitivity = "-0.5";
          };

          input = {
            kb_options = "ctrl:nocaps";
            kb_layout = "us";
            follow_mouse = 1;
            sensitivity = 0;
            touchpad.natural_scroll = true;
            touchpad.clickfinger_behavior = true;
          };
        };
      };
    }
  ];
}
