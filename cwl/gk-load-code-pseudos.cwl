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
  code_title: string

steps:
  get_code_pseudo_ext:
    run: gk--get-code-pseudo-ext.cwl
    in:
      db: db
      code_title: code_title
    out:
      [code_pseudo_ext]

  get_pseudo_kinds:
    run: gk--get-pseudo-kinds.cwl
    in:
      db: db
      code_title: code_title
    out:
      [kinds]

  load_code_pseudos:
    run: gk--load-pseudo.cwl
    scatter: kind
    in:
      db: db
      code_title: code_title
      ext: get_code_pseudo_ext/code_pseudo_ext
      kind: get_pseudo_kinds/kinds
    out: [pseudo_file]

outputs:
  pseudo_files:
    type: File[]
    outputSource: load_code_pseudos/pseudo_file
