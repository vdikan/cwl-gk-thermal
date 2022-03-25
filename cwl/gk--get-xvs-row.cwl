#!/usr/bin/env cwl-runner

cwlVersion: "v1.2"
class: CommandLineTool

requirements:
  ShellCommandRequirement: {}
  InlineJavascriptRequirement: {}

arguments:
  - awk
  - $('{if(NR==' + inputs.nrow + ') print $0}')
  - $(inputs.xvs)
  - shellQuote: false
    valueFrom: '|'
  - jq
  - -s
  - "{values: .}"

inputs:
  nrow: int
  xvs: File

stdout: cwl.output.json
outputs:
  values: double[]
