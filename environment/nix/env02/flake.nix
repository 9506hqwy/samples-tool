{
  description = "env02 Python 3.14";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      formatter.${system} = pkgs.nixfmt-tree;
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          pkgs.python314
          pkgs.pkg-config
          pkgs.libffi
          pkgs.openssl
          pkgs.zlib
          pkgs.stdenv.cc.cc.lib
        ];
        shellHook = ''
          source .venv/bin/activate

          export LD_LIBRARY_PATH="${pkgs.libffi}/lib:$LD_LIBRARY_PATH"
          export LD_LIBRARY_PATH="${pkgs.openssl.out}/lib:$LD_LIBRARY_PATH"
          export LD_LIBRARY_PATH="${pkgs.zlib}/lib:$LD_LIBRARY_PATH"
          export LD_LIBRARY_PATH="${pkgs.stdenv.cc.cc.lib}/lib:$LD_LIBRARY_PATH"
        '';
      };
    };
}
