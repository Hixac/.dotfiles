{ config, lib, pkgs, ... }:

let
  cfg = config.services.tg-ws-proxy;
  pkg = pkgs.callPackage ../pkgs/tg-ws-proxy-rs.nix { };

  secretFile = "${config.home.homeDirectory}/.config/tg-ws-proxy/secret";

  # Reads the persisted secret at every service start and passes it via --secret.
  # This guarantees the tg:// link stays identical across reboots and restarts.
  startScript = pkgs.writeShellScript "tg-ws-proxy-start" ''
    set -euo pipefail
    secret="$(cat ${lib.escapeShellArg secretFile})"
    exec ${pkg}/bin/tg-ws-proxy \
      --host ${lib.escapeShellArg cfg.host} \
      --port ${toString cfg.port} \
      --secret "$secret" \
      --default-domains \
      --cf-priority \
      --link-ip ${lib.escapeShellArg cfg.host} \
      ${lib.escapeShellArgs cfg.extraArgs}
  '';
in
{
  options.services.tg-ws-proxy = {
    enable = lib.mkEnableOption "tg-ws-proxy user service";

    host = lib.mkOption {
      type    = lib.types.str;
      default = "127.0.0.1";
    };

    port = lib.mkOption {
      type    = lib.types.port;
      default = 1080;
    };

    extraArgs = lib.mkOption {
      type    = lib.types.listOf lib.types.str;
      default = [ ];
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkg ];

    # Generate the secret exactly once. Never overwrite it afterwards.
    home.activation.tgWsProxySecret = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      if [ ! -s "${secretFile}" ]; then
        mkdir -p "$(dirname "${secretFile}")"
        ${pkgs.openssl}/bin/openssl rand -hex 16 > "${secretFile}"
        chmod 600 "${secretFile}"
      fi
    '';

    # Expose the path so your applications can `cat` the raw hex secret.
    home.sessionVariables.TG_WS_PROXY_SECRET_FILE = secretFile;

    systemd.user.services.tg-ws-proxy = {
      Unit = {
        Description = "TG WS Proxy (Rust)";
        After       = [ "network.target" ];
      };
      Service = {
        ExecStart  = "${startScript}";
        Restart    = "on-failure";
        RestartSec = "3s";
      };
      Install.WantedBy = [ "default.target" ];
    };
  };
}
