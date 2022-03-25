#!/usr/local/bin cwl-runner

cwlVersion: v1.2
class: CommandLineTool

requirements:
  ShellCommandRequirement: {}
  InlineJavascriptRequirement: {}

arguments:
  - sqlite3
  - $(inputs.db)
  - $('select json_object(\'code_command\', command) from code where title="' + inputs.code_title + '";')
  - '.exit'

inputs:
  db:
    type: File

  code_title:
    type: string

stdout: cwl.output.json
outputs:
  code_command:
    type: string
#    outputBinding:
#      outputEval: $(self[0].code_command)
