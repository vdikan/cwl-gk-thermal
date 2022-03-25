#!/usr/bin/env cwltool

cwlVersion: v1.2
class: CommandLineTool

requirements:
  ShellCommandRequirement: {}
  InlineJavascriptRequirement: {}
  InitialWorkDirRequirement:
    listing:
      - $(inputs.fdf)
      - $(inputs.pseudos)
      - $(inputs.xvs)

arguments:
  - $(inputs.command)
  - $(inputs.fdf)

inputs:
  command: string
  fdf: File
  xvs: File

  pseudos:
    type:
      type: array
      items: File

stdout: output
outputs:
  output_file:
    type: stdout
