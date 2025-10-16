{ config, pkgs, ... }:

let
  # Путь к домашней папке пользователя, куда будут сохраняться файлы из контейнера
  limDownloads = "/home/lim/Downloads";
in
{
  # Включаем Docker
  virtualisation.docker.enable = true;

  # Systemd сервис для Ubuntu контейнера
  systemd.services.docker-ubuntu = {
    description = "Docker container with Ubuntu";
    after = [ "network.target" "docker.service" ];
    wants = [ "docker.service" ];

    serviceConfig = {
      Type = "simple";
      Restart = "always";
      ExecStart = ''
        docker run --rm \
          --name ubuntu-container \
          -v ${limDownloads}:/root/Downloads \
          -d ubuntu:24.04 tail -f /dev/null
      '';
      ExecStop = "docker stop ubuntu-container";
      # User = "lim"  # можно не указывать, если пользователь сам добавлен в группу docker
    };
  };
}

