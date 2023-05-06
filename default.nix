with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "devdenbot";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [
    nodejs-18_x
    yarn
    cairo
    pango
    pkg-config
    nodePackages.node-gyp
    libpng
    llvm
    librsvg
    pixman
    giflib
    libjpeg
    pkgs.darwin.apple_sdk.frameworks.CoreText
  ];

  shellHook = ''
    export NIX_LDFLAGS="-F${pkgs.darwin.apple_sdk.frameworks.CoreText}/Library/Frameworks -framework CoreText $NIX_LDFLAGS";
  '';
}