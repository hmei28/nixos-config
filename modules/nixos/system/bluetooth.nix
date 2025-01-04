{ ... }:
{
  hardware.bluetooth.enable = true;
  services = {
    # GTK bluetooth viewer
    blueman.enable = true;
  };
}
