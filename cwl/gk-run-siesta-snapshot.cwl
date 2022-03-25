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
  get-command:
    run: gk--get-code-command.cwl
    in:
      db: db
      code_title:
        default: "siesta"
    out:
      [code_command]

  load_xvs:
    run: gk-load-siesta-xvs.cwl
    in:
      db: db
      step: step
    out:
      [xvs_file]

  load_pseudos:
    run: gk-load-code-pseudos.cwl
    in:
      db: db
      code_title:
        default: "siesta"
    out:
      [pseudo_files]

  load_input:
    run: gk-load-code-input.cwl
    in:
      db: db
      code_title:
        default: "siesta"
    out:
      [input_file]

  run_siesta:
    run: gk-run-siesta-with.cwl
    in:
      command: get-command/code_command
      fdf: load_input/input_file
      xvs: load_xvs/xvs_file
      pseudos: load_pseudos/pseudo_files
    out:
      [output_file]

outputs:
  gk_siesta_output:
    type: File
    outputSource: run_siesta/output_file
