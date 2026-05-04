{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          cargo
          rustc
          rustfmt
          clippy
          rust-analyzer
        ];
        nativeBuildInputs = [ pkgs.pkg-config ];
        shellHook = ''
                  # Customizing the PS1 (Prompt String 1)
                  # \w is the current working directory

                  export PS1="\[\033[1;31m\][rust]:\w$ \[\033[0m\]"

                  echo "Welcome to the Rust Development Environment!"
                '';

        env.RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
      };

      packages.${system}.default = pkgs.rustPlatform.buildRustPackage {
        name = "Tutorial";
        src = ./.;
        buildInputs = with pkgs; [];
        nativeBuildInputs = with pkgs; [ pkg-config ];
        cargoHash = "sha256-CRPExRYP/uFJcbsZnBQdgv6tmPsDHhFtDdp9PMkAY7s=";
      };
  };
}
