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
  code_title: string
  step: int

steps:
  get_code_currents:
    run: gk--get-code-currents.cwl
    in:
      db: db
      code_title: code_title
    out:
      [currents]

  store_code_results:
    run: gk-store-result.cwl
    scatter: current_title
    in:
      current_title: get_code_currents/currents
      db: db
      output_file: output_file
      step: step
    out: []

outputs: []
