{
  description = "Resume and CV LaTeX build environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            (texlive.combine {
              inherit (texlive)
                scheme-basic
                geometry
                lm
                enumitem
                titlesec
                xcolor
                tcolorbox
                hyperref;
            })
            texlivePackages.latexmk
            bash
            coreutils
            findutils
          ];

          shellHook = ''
            echo "LaTeX environment loaded (minimal)"
          '';
        };
      }
    );
}
