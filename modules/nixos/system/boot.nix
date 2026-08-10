{ pkgs, ... }:
{
  boot = {
    loader= {
      efi.canTouchEfiVariables = true;
      timeout = 0;
      systemd-boot = {
        enable = true;
        configurationLimit = 6;
      };
    };
    plymouth = {
      enable = true;
      theme = "catppuccin-macchiato";
      themePackages = [ pkgs.catppuccin-plymouth ];
    };

    # Enable "Silent boot"
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
      "vt.global_cursor_default=0"
    ];
    # Hide the OS choice for bootloaders.
    # It's still possible to open the bootloader list by pressing any key
    # It will just not appear on screen unless a key is pressed

  };
}
