{
  services.power-profiles-daemon.enable = false;

  services.tlp.enable = true;

  services.tlp.settings = {
    START_CHARGE_THRESH_BAT0 = 0;
    STOP_CHARGE_THRESH_BAT0  = 80;
  };
}

