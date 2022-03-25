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
  - $('SELECT ' +
    'printf(\'%16.12E\', pos_x),' +
    'printf(\'%16.12E\', pos_y),' +
    'printf(\'%16.12E\', pos_z),' +
    'printf(\'%16.12E\', vel_x),' +
    'printf(\'%16.12E\', vel_y),' +
    'printf(\'%16.12E\', vel_z) FROM snapshot WHERE step=' +
    inputs.step + ' ORDER BY atom_id ASC;')
  - ".exit"

inputs:
  db: File
  step: int

stdout: XVS.dat
outputs:
  xvs_file:
    type: stdout
