{ pkgs, 
stdenv, 
makeDesktopItem, 
makeWrapper, 
lib,
libpulseaudio, 
libXxf86vm, 
libGL,
libX11,
libXcursor,
libXext,
libXrandr,
libjack2,
libusb1,
xrandr
}:

let

  libPath = lib.makeLibraryPath [
    libpulseaudio
    libXxf86vm
    libGL
    libX11
    libXcursor
    libXext
    libXrandr
    libjack2
    libusb1
    xrandr
  ];

  jdk = pkgs.jdk8;
  jre = pkgs.jre8;

in stdenv.mkDerivation {
  name = "beeshield";

  src = ./bslauncher.jar;

  nativeBuildInputs = [ makeWrapper ];

  unpackPhase = "${jdk}/bin/jar xf $src favicon.png";

  installPhase = ''
    mkdir -p $out/bin $out/share/bslauncher

    makeWrapper ${jre}/bin/java $out/bin/bslauncher \
      --add-flags "-jar $out/share/bslauncher/bslauncher.jar" \
      --suffix LD_LIBRARY_PATH : ${libPath}

    cp $src $out/share/bslauncher/bslauncher.jar
  '';
}