#!/usr/bin/env cwl-runner

cwlVersion: "v1.2"
class: Workflow

requirements:
  ShellCommandRequirement: {}
  InlineJavascriptRequirement: {}

inputs:
  db: File
  xvs: File
  step: int
  atom_id: int

outputs: []

steps:
  get-row:
    run: gk--get-xvs-row.cwl
    in:
      nrow: atom_id
      xvs: xvs
    out: [values]

  push-db-row:
    run: gk--push-db-xvs-row.cwl
    in:
      db: db
      step: step
      atom_id: atom_id
      values: get-row/values
    out: []
