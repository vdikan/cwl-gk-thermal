#!/usr/local/bin cwl-runner

class: CommandLineTool
cwlVersion: v1.2

requirements:
  ShellCommandRequirement: {}
  InlineJavascriptRequirement: {}

arguments:
  - sqlite3
  - $(inputs.db)
  - ".mode column"
  - ".width 5 20 20 20"
  - $('SELECT atomlist.kind,' +
    'printf(\'%16.12E\', xvs.pos_x),' +
    'printf(\'%16.12E\', xvs.pos_y),' +
    'printf(\'%16.12E\', xvs.pos_z) FROM '+
    '(SELECT * FROM snapshot where step=' + inputs.step + ') as xvs ' +
    'LEFT JOIN atomlist ON atomlist.atom_id = xvs.atom_id ' +
    'ORDER BY xvs.atom_id ASC;')
  - ".exit"

inputs:
  db: File
  step: int

stdout: XS.dat
outputs:
  xs_file:
    type: stdout
