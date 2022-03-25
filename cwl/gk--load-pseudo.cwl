#!/usr/local/bin cwl-runner

cwlVersion: v1.2
class: CommandLineTool

requirements:
  ShellCommandRequirement: {}
  InlineJavascriptRequirement: {}

arguments:
  - sqlite3
  - $(inputs.db)
  - $('SELECT (data) from pseudo WHERE (code_title,kind)=("' +
    inputs.code_title + '","' + inputs.kind + '");')
  - '.exit'

inputs:
  db: File
  kind: string
  code_title: string
  ext: string

stdout: $(inputs.kind + '.' + inputs.ext)
outputs:
  pseudo_file:
    type: stdout
