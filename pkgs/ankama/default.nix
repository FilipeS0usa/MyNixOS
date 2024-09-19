{ appimageTools, fetchurl, lib }:
let
  pname = "ankama-launcher";
  version = "0.6.30";

  src = fetchurl {
    url = "https://launcher.cdn.ankama.com/installers/production/Dofus-Setup-x86_64.AppImage";
    hash = "sha256-ssCjFrQYI/pxnsjcy1xLSpuGGy0NGMOcNP9RiNDhE/w=";
  };
in
appimageTools.wrapType2 {
  inherit pname version src;
  extraPkgs = pkgs: [ pkgs.wine ];
}
