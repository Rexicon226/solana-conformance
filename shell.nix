{ pkgs ? import <nixpkgs> {} }:


pkgs.mkShell {
  buildInputs = [
    pkgs.python311Full 
    pkgs.uv
    pkgs.protobuf_27
    pkgs.cargo
  ];

  shellHook = ''
    uv venv
    source .venv/bin/activate
    git clone https://github.com/firedancer-io/solfuzz-agave impl/solfuzz-agave
    cd impl/solfuzz-agave
    git clone https://github.com/firedancer-io/protosol
    cd ../../
  '';
}
