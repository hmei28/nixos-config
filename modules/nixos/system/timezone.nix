{ config, lib, ... }:
{
  options = {
    timezone = lib.mkOption {
      description = "Timezone to apply to host";
      type = lib.types.str;
      default = "Europe/Zurich";
    };
  };

  config = {
    time.timeZone = config.timezone;
  };
}
