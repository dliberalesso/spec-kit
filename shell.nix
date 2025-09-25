{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShellNoCC {
  packages = with pkgs; [
    python3
    python3Packages.hatchling
    python3Packages.httpx-socks
    python3Packages.platformdirs
    python3Packages.readchar
    python3Packages.rich
    python3Packages.truststore
    python3Packages.typer
  ];
}
