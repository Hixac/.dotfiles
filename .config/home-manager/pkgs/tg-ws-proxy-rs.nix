{ lib, rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "tg-ws-proxy-rs";
  version = "2.5.10";

  src = fetchFromGitHub {
    owner = "valnesfjord";
    repo = "tg-ws-proxy-rs";
    rev = "v${version}";
    hash = "sha256-qhavPigPvDNr2tt/x/XYGWRR7aFdZWRtGK2LKzAkgqE=";
  };

  cargoHash = "sha256-9bzdVeHacK3HLZw56foFBcDq+H2MlbPgES7g1eo2HYg=";
  doCheck = false;

  meta = with lib; {
    description = "Telegram MTProto WebSocket Bridge Proxy — Rust port of Flowseal/tg-ws-proxy";
    homepage = "https://github.com/valnesfjord/tg-ws-proxy-rs";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
