{ self, inputs, ... }:

{
  flake.nixosModules.niri = { pkgs, lib, ... }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
    };
  };

  perSystem = { pkgs, lib, self', ... }: {
    packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;
      settings = {
        spawn-at-startup = [
          (lib.getExe self'.packages.myNoctalia)
          "discord"
        ];

        outputs."eDP-1" = {
          mode = "1920x1200@60";
          "position x=0 y=0" = null;
        };

        outputs."HDMI-A-1" = {
          mode = "1920x1080@144";
          "position x=4992 y=0" = null;
        };

        outputs."DP-1" = {
          mode = "3840x2160@100";
          scale = 1.25;
          "position x=1920 y=0" = null;
        };

        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

         input = {
           keyboard.xkb.layout = "pl";
           touchpad = {
             tap = null;
             natural-scroll = null;
           };
         };

         layout = {
     	  gaps = 3;
     	  default-column-width.proportion = 0.5;
     	  focus-ring = {
     	    width = 2;
        	    active-color = "#009f1dcc";
     	    inactive-color = "#595959aa";
	   };
	};

         binds = {
           # "Mod+Return".spawn-sh = lib.getExe pkgs.kitty;
           # "Mod+Q".close-window = null;
           "Mod+S".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call launcher toggle";
     	  #"Mod+Z".spawn-sh = "zeditor";
     	  "Mod+Z".spawn-sh = lib.getExe pkgs.zed-editor;
     	  "Mod+B".spawn-sh = lib.getExe pkgs.brave;
     	  "Mod+Q".spawn-sh = lib.getExe pkgs.kitty;
           "Mod+R".spawn-sh = "${lib.getExe pkgs.wofi} --show drun";
           "Mod+Shift+C".close-window = null;
           "Mod+Shift+O".toggle-overview = null;
           "Mod+F".maximize-column = null;
           "Mod+Shift+F".fullscreen-window = null;
           "Mod+G".toggle-windowed-fullscreen = null;

           "Mod+Comma".consume-or-expel-window-left = null;
           "Mod+Period".consume-or-expel-window-right = null;

           "Mod+Home".focus-column-first = null;
           "Mod+End".focus-column-last = null;
           "Mod+Shift+Home".move-column-to-first = null;
           "Mod+Shift+End".move-column-to-last = null;

           "Mod+H".focus-column-left = null;
           "Mod+L".focus-column-right = null;
           "Mod+U".focus-window-up = null;
           "Mod+M".focus-window-down = null;

           "Mod+Shift+H".move-column-left = null;
           "Mod+Shift+L".move-column-right = null;

	   "Mod+BracketLeft".focus-monitor-left = null;
	   "Mod+BracketRight".focus-monitor-right = null;
	   "Mod+Shift+BracketLeft".move-column-to-monitor-left = null;
	   "Mod+Shift+BracketRight".move-column-to-monitor-right = null;

           "Mod+V".toggle-window-floating = null;
           "Mod+Shift+V".switch-focus-between-floating-and-tiling = null;

           "Mod+W".toggle-column-tabbed-display = null;

           "Mod+C".consume-window-into-column = null;
           "Mod+E".expel-window-from-column = null;

           "Mod+Tab".focus-window-down-or-column-right = null;

           "Mod+J".focus-workspace-down = null;
           "Mod+K".focus-workspace-up = null;
           "Mod+Shift+J".move-column-to-workspace-down = null;
           "Mod+Shift+K".move-column-to-workspace-up = null;

           "Mod+1".focus-workspace = 1;
           "Mod+2".focus-workspace = 2;
           "Mod+3".focus-workspace = 3;
           "Mod+4".focus-workspace = 4;
           "Mod+5".focus-workspace = 5;
           "Mod+6".focus-workspace = 6;
           "Mod+7".focus-workspace = 7;
           "Mod+8".focus-workspace = 8;
           "Mod+9".focus-workspace = 9;

           "Mod+Minus".set-column-width = "-10%";
           "Mod+Equal".set-column-width = "+10%";

           "Mod+T".switch-preset-column-width = null;
           "Mod+Shift+T".reset-window-height = null;
           "Mod+Shift+Slash".show-hotkey-overlay = null;
         };
       };
    };
  };
}
