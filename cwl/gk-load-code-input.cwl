#!/usr/local/bin cwl-runner

class: CommandLineTool
cwlVersion: v1.2

requirements:
  ShellCommandRequirement: {}
  InlineJavascriptRequirement: {}

arguments:
  - sqlite3
  - $(inputs.db)
  - $('SELECT (data) from input WHERE code_title="' + inputs.code_title + '";')
  - '.exit'

inputs:
  db: File
  code_title: string

stdout: input
outputs:
  input_file:
    type: stdout
