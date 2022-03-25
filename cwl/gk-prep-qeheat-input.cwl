#!/usr/local/bin cwl-runner

class: CommandLineTool
cwlVersion: v1.2

requirements:
  ShellCommandRequirement: {}
  InlineJavascriptRequirement: {}
  InitialWorkDirRequirement:
    listing:
      - $(inputs.xs_file)
      - $(inputs.vs_file)

inputs:
  in_file: File
  xs_file: File
  vs_file: File

arguments:
  - cat
  - $(inputs.in_file)
  - shellQuote: false
    valueFrom: '|'
  - awk
  - $('/:xs:/{system("cat ' + inputs.xs_file.basename + '");next}1')
  - shellQuote: false
    valueFrom: '|'
  - awk
  - $('/:vs:/{system("cat ' + inputs.vs_file.basename + '");next}1')

stdout: in.pw
outputs:
  in_pw:
    type: stdout
