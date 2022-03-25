#!/usr/local/bin cwl-runner

cwlVersion: v1.2
class: CommandLineTool

requirements:
  ShellCommandRequirement: {}
  InlineJavascriptRequirement: {}

arguments:
  - sqlite3
  - $(inputs.db)
  - $('SELECT DISTINCT json_object(\'title\', title) FROM current WHERE code_title="' +
    inputs.code_title + '";')
  - '.exit'
  - shellQuote: false
    valueFrom: '|'
  - jq
  - -s
  - "{currents: map(.title)}"

inputs:
  db:
    type: File

  code_title:
    type: string

stdout: cwl.output.json
outputs:
  currents:
    type: string[]
