{ config, inputs, ... }:

{
  # Passwordless sudo when SSH'ing with keys
  #security.pam.sshAgentAuth.enable = true;

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "yes";
    };
  };
}
