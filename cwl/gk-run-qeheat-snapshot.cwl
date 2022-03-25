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
        default: "qeheat"
    out:
      [code_command]

  load_pseudos:
    run: gk-load-code-pseudos.cwl
    in:
      db: db
      code_title:
        default: "qeheat"
    out:
      [pseudo_files]

  load_xs:
    run: gk-load-qeheat-xs.cwl
    in:
      db: db
      step: step
    out:
      [xs_file]

  load_vs:
    run: gk-load-qeheat-vs.cwl
    in:
      db: db
      step: step
    out:
      [vs_file]

  load_input:
    run: gk-load-code-input.cwl
    in:
      db: db
      code_title:
        default: "qeheat"
    out:
      [input_file]

  preprocess_input:
    run: gk-prep-qeheat-input.cwl
    in:
      in_file: load_input/input_file
      xs_file: load_xs/xs_file
      vs_file: load_vs/vs_file
    out:
      [in_pw]

  run_qeheat:
    run: gk-run-qeheat-with.cwl
    in:
      command: get-command/code_command
      pseudos: load_pseudos/pseudo_files
      pw: preprocess_input/in_pw
    out:
      [output_file, results_file]

outputs:
  gk_qeheat_results:
    type: File
    outputSource: run_qeheat/results_file
