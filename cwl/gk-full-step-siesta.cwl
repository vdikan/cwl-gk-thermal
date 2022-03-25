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
  run_siesta_snapshot:
    run: gk-run-siesta-snapshot.cwl
    in:
      db: db
      step: step
    out:
      [gk_siesta_output]

  store_siesta_results:
    run: gk-store-code-results.cwl
    in:
      db: db
      step: step
      output_file: run_siesta_snapshot/gk_siesta_output
      code_title:
        default: "siesta"
    out: []

outputs: []
