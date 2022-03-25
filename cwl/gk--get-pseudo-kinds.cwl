#!/usr/local/bin cwl-runner

cwlVersion: v1.2
class: CommandLineTool

requirements:
  ShellCommandRequirement: {}
  InlineJavascriptRequirement: {}

arguments:
  - sqlite3
  - $(inputs.db)
  - $('select distinct json_object(\'kind\', kind) from pseudo;')
  - '.exit'
  - shellQuote: false
    valueFrom: '|'
  - jq
  - -s
  - "{kinds: map(.kind)}"

inputs:
  db:
    type: File

  code_title:
    type: string

stdout: cwl.output.json
outputs:
  kinds:
    type: string[]
#    outputBinding:
#      outputEval: $(self.kinds)
