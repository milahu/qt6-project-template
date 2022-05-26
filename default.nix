/*
nix-build -E 'with import ./nixpkgs {}; qt6Packages.callPackage ./default.nix {}'

nix-build -E 'with import <nixpkgs> {}; qt6Packages.callPackage ./default.nix {}'

nix-build -E 'with import (builtins.fetchTarball https://github.com/NixOS/nixpkgs/archive/05ced71757730406ca3eb3e58503f05334a6057d.tar.gz) {}; qt6Packages.callPackage ./default.nix {}'
*/

{ lib
, stdenv
#, fetchFromGitHub
, cmake
#, pkg-config
, qtbase
, wrapQtAppsHook
}:

stdenv.mkDerivation rec {
  pname = "helloworld";
  version = "1.0.0";

  src = ./.;

  /*
  src = fetchFromGitHub {
    owner = "easymodo";
    repo = pname;
    rev = "v${version}";
    sha256 = "YlV/ysm7bdPverpKpanrL+jPVvMtP1paoAm0PREMaww=";
  };
  */

  nativeBuildInputs = [
    cmake
    #pkg-config
    wrapQtAppsHook
  ];

  buildInputs = [
  ];

  propagatedBuildInputs = [
    qtbase
  ];

  meta = with lib; {
    description = "Hello World";
    homepage = "https://github.com/ghost/helloworld";
    license = licenses.mit;
    platforms = platforms.linux;
    #maintainers = with maintainers; [ ghost ];
  };
}
