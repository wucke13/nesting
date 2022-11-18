{
  description = "Flake utils demo";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in
      rec {
        packages.default = pkgs.stdenv.mkDerivation {
          name = "nesting";
          nativeBuildInputs = with pkgs; [
            meson pkg-config ninja
          ];
          buildInputs = with pkgs; [
            glew.dev
            freeglut.dev
            glui
            opencv2
            boost
            cgal
            gmp.dev
            glew.dev
            mpfr
            xorg.libX11
            xorg.libXxf86vm
            xorg.libXrandr
            libGL
            libGLU
          ];
          BOOST_INCLUDEDIR = "${pkgs.boost.dev}/include";
          BOOST_LIBRARYDIR = "${pkgs.boost}/lib";
          src = ./.;
        };
        devShells.default = pkgs.mkShell {
          inputsFrom = [ packages.default ];
          BOOST_INCLUDEDIR = "${pkgs.boost.dev}/include";
          BOOST_LIBRARYDIR = "${pkgs.boost}/lib";
        };
      }
    );
}
