{ ... }:
{
  # Compressed swap in RAM (~7 GiB with 14 GiB RAM): absorbs memory spikes
  # during builds instead of freezing the whole session
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
  };

  # Kill the biggest memory hog while ~5% RAM is still available, before the
  # UI freezes completely. freeSwapThreshold = 100: there is no disk swap, so
  # the swap criterion must never block the kill.
  services.earlyoom = {
    enable = true;
    freeMemThreshold = 5;
    freeSwapThreshold = 100;
  };
}
