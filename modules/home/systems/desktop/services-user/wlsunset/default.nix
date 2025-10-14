{ config, lib, ... }:

lib.mkIf config.systems.desktop.services-user.wlsunset.enable {

  services.wlsunset = {
    enable = true;
    temperature.night = 3000;
    # Coordenadas de São Carlos, já que é sua localização atual :)
    latitude = "-22.01";
    longitude = "-47.89";
  };

}
