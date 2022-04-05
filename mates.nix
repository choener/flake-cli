{ lib, fetchFromGitHub, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "mates.rs";
  version = "0.3.0";
  src = fetchFromGitHub {
    owner = "pimutils";
    repo = pname;
    rev = "refs/tags/${version}";
    #rev = "4973303ee9305c8b7e05b8724d7105a277524364";
    sha256 = "sha256-XX+TfoWDum7m4RMwqyFXdTUeLtGmamTj6Yr/2Tu5h6U=";
  };
  #cargoSha256 = "sha256-lUohLWAj0eIA0d+yZGIaidWwXGM89XHsT8ysnN7SK/s=";
  cargoLock = {
    lockFile = "${src}/Cargo.lock";
  };
  meta = with lib; {
  };
}
