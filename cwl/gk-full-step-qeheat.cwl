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
  step: int

steps:
  run_qeheat_snapshot:
    run: gk-run-qeheat-snapshot.cwl
    in:
      db: db
      step: step
    out:
      [gk_qeheat_results]

  store_qeheat_results:
    run: gk-store-code-results.cwl
    in:
      db: db
      step: step
      output_file: run_qeheat_snapshot/gk_qeheat_results
      code_title:
        default: "qeheat"
    out: []

outputs: []
