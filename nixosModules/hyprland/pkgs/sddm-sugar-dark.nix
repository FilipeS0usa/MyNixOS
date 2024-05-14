{ pkgs }:

let
  imgLink = "https://github.com/FilipeS0usa/B3rryPI-OS/blob/d2d145e3e3917f3f74d7a8e123fa8cc13cd76414/homeManagerModules/hyprland/files/Wallpapers/12.png"; 

  image = pkgs.fetchurl {
    url = imgLink;
    sha256 = "sha256-2R4rMZtwDYYn+rczM2pVXPVyAvdK+m760ULtu+hMW3M=";
  };
in
pkgs.stdenv.mkDerivation {
  name = "sddm-sugar-dark";
  src = pkgs.fetchFromGitHub {
    owner = "MarianArlt";
    repo = "sddm-sugar-dark";
    rev = "ceb2c455663429be03ba62d9f898c571650ef7fe";
    sha256 = "0153z1kylbhc9d12nxy9vpn0spxgrhgy36wy37pk6ysq7akaqlvy";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    cd $out/
    rm Background.jpg
    cp -r ${image} $out/Background.jpg
  '';
}
