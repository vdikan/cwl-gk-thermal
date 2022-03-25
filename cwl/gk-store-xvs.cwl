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
  xvs: File
  step: int
  # natoms: int

steps:
  get_natoms:
    run: gk--get-natoms.cwl
    in:
      db: db
    out:
      [natoms]

  gen_index_range:
    run: index-range.cwl
    in:
      natoms: get_natoms/natoms
      # natoms: natoms
    out: [index_range]

  store-xvs-row:
    run: gk--store-xvs-row.cwl
    # source: atom_id_array
    scatter: atom_id
    in:
      atom_id: gen_index_range/index_range
      db: db
      xvs: xvs
      step: step
    out: []

outputs: []
