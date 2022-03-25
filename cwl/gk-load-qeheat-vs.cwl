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
    'printf(\'%16.12E\', xvs.vel_x*0.0483776900146),' +
    'printf(\'%16.12E\', xvs.vel_y*0.0483776900146),' +
    'printf(\'%16.12E\', xvs.vel_z*0.0483776900146) FROM '+
    '(SELECT * FROM snapshot where step=' + inputs.step + ') as xvs ' +
    'LEFT JOIN atomlist ON atomlist.atom_id = xvs.atom_id ' +
    'ORDER BY xvs.atom_id ASC;')
  - ".exit"

inputs:
  db: File
  step: int

stdout: VS.dat
outputs:
  vs_file:
    type: stdout
