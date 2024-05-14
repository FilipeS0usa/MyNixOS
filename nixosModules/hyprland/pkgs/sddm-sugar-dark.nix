{ pkgs }:

let
  imgLink = "https://github.com/FilipeS0usa/B3rryPI-OS/blob/18b2ad7d2bbe27e89cae61485f079354174024a3/homeManagerModules/hyprland/files/Wallpapers/12.png"; 

  image = pkgs.fetchurl {
    url = imgLink;
    sha256 = "sha256-AkOA/QEIdZ4r95HF5kf/01TITJw3lqhTwCy2/hbBN/M=";
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
