#!/usr/bin/env cwltool

cwlVersion: v1.2
class: CommandLineTool

requirements:
  ShellCommandRequirement: {}
  InlineJavascriptRequirement: {}
  InitialWorkDirRequirement:
    listing:
      - $(inputs.pw)
      - $(inputs.pseudos)

arguments:
  - $(inputs.command)
  - -in
  - $(inputs.pw)

inputs:
  command: string
  pw: File

  pseudos:
    type:
      type: array
      items: File

stdout: output
outputs:
  output_file:
    type: stdout

  results_file:
    type: File
    outputBinding:
      glob: "current_hz"
