{ config, lib, ... }:

{
  services.wlsunset = {
    enable = true;
    temperature.night = 3000;
    # Coordenadas de São Carlos, já que é sua localização atual :)
    latitude = "-22.01";
    longitude = "-47.89";
  };

}
