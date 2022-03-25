#!/usr/bin/env cwl-runner

cwlVersion: "v1.2"
class: CommandLineTool

requirements:
  ShellCommandRequirement: {}
  InlineJavascriptRequirement: {}

arguments:
  - sqlite3
  - $(inputs.db)
  - $('insert into result (current_title,step,sp_x,sp_y,sp_z) values (' +
    '"' + inputs.current_title + '",' +
    inputs.step + ',' +
    inputs.values[0] + ',' +
    inputs.values[1] + ',' +
    inputs.values[2] + ');')
  - '.exit'

inputs:
  db: File
  current_title: string
  step: int
  values: double[]

outputs: []
