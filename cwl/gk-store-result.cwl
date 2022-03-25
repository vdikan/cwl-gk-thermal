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
  step: int

steps:
  parse_current:
    run: gk-parse-current.cwl
    in:
      db: db
      output_file: output_file
      current_title: current_title
    out:
      [out_vector]

  store_current:
    run: gk--push-db-result.cwl
    in:
      db: db
      current_title: current_title
      step: step
      values: parse_current/out_vector
    out: []

outputs: []
