#!/usr/bin/env cwl-runner

cwlVersion: "v1.2"
class: Workflow

requirements:
  InlineJavascriptRequirement: {}
  ScatterFeatureRequirement: {}
  SubworkflowFeatureRequirement: {}
  StepInputExpressionRequirement: {}

inputs:
  db: File
  output_file: File
  current_title: string

steps:
  get_parse_string:
    run: gk--get-current-parse-string.cwl
    in:
      db: db
      current_title: current_title
    out:
      [parse_string]

  parse_current_vector:
    run: parse-vector234.cwl
    in:
      in_file: output_file
      parse_string: get_parse_string/parse_string
    out: [out_vector]

outputs:
  out_vector:
    type: double[]
    outputSource: parse_current_vector/out_vector
