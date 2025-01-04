{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    file
    git
    git-lfs
    lsof
    dnsutils
    wget
    libinput
    acpid
    ddcutil
  ];
  services = {
    udev = {
      packages = [ pkgs.yubikey-personalization ];
      # add group i2c to manage monitor exeternal 
#      extraRules = ''
#        KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
#      '';
    };
    acpid.enable = true;
    # for file manager nautilus
    udisks2.enable = true;
    gvfs.enable = true;
  };
}
