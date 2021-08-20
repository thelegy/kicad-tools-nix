{ lib, runCommand, kibot, kikit }:
with lib;


{ name
, src
, pcbFileName ? "${name}.kicad_pcb"
, extractBoards ? {}
}:

let
  toSourceAreaArg = (flip pipe) [
    (splitString " ")
    escapeShellArgs
  ];
in runCommand name { inherit src; } ''
  export HOME=$(mktemp -d)
  mkdir $HOME/.config
  cp -r --reflink=auto ${./kicad_config} $HOME/.config/kicad
  chmod -R u+w $HOME/.config
  shopt -s extglob
  cp -r --reflink=auto --no-preserve=ownership,mode $src/* $src/.!(|.) .
  ${pipe extractBoards [
    attrNames
    (concatMapStrings (boardName: ''
      ${kikit}/bin/kikit panelize extractboard \
        --sourcearea ${toSourceAreaArg extractBoards.${boardName}} \
        ${escapeShellArg pcbFileName} \
        ${escapeShellArg "${boardName}.kicad_pcb"}
    ''))
  ]}
  for file in *.kibot.yaml; do
    pcbFile="''${file%%.kibot.yaml}.kicad_pcb"
    schFile="''${file%%.kibot.yaml}.sch"
      touch "$pcbFile" "$schFile"
    ${kibot}/bin/kibot \
      --plot-config "$file" \
      --board-file "$pcbFile" \
      --schematic "$schFile" \
      --out-dir $out
  done
''
