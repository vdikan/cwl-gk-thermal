#!/usr/local/bin cwl-runner

cwlVersion: v1.2
class: CommandLineTool

requirements:
  ShellCommandRequirement: {}
  InlineJavascriptRequirement: {}

arguments:
  - grep
  - $(inputs.parse_string)
  - $(inputs.in_file)
  - shellQuote: false
    valueFrom: '|'
  - awk
  - '{print $2, $3, $4}'
  - shellQuote: false
    valueFrom: '|'
  - jq
  - -s
  - "{out_vector: .}"

inputs:
  in_file: File
  parse_string: string

stdout: cwl.output.json
outputs:
  out_vector:
    type: double[]
