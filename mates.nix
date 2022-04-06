{ lib, fetchFromGitHub, rustPlatform
, ncurses }:

rustPlatform.buildRustPackage rec {
  pname = "mates.rs";
  version = "0.3.0";
  src = fetchFromGitHub {
    owner = "choener";
    repo = pname;
    rev = "1b2ec98";
    sha256 = "sha256-Y63WgeTx8byAx0STp+qsy6HTCXLTWibTP7PdlrrmQvk=";
  };
  cargoSha256 = "sha256-v3HWT+uLtOISbd0D7MqN2dD7OZ5rFODHM3Iyma5vOs4=";
  buildInputs = [ ncurses ];
  meta = with lib; {
  };
}
