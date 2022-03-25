#!/usr/bin/env cwl-runner

cwlVersion: "v1.2"
class: CommandLineTool

requirements:
  ShellCommandRequirement: {}
  InlineJavascriptRequirement: {}

arguments:
  - sqlite3
  - $(inputs.db)
  - $('insert into snapshot (step,atom_id,pos_x,pos_y,pos_z,vel_x,vel_y,vel_z) values (' +
    inputs.step + ',' +
    inputs.atom_id + ',' +
    inputs.values[0] + ',' +
    inputs.values[1] + ',' +
    inputs.values[2] + ',' +
    inputs.values[3] + ',' +
    inputs.values[4] + ',' +
    inputs.values[5] + ')')
  - '.exit'

inputs:
  db: File
  step: int
  atom_id: int
  values: double[]

outputs: []
