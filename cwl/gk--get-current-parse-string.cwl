#!/usr/local/bin cwl-runner

cwlVersion: v1.2
class: CommandLineTool

requirements:
  ShellCommandRequirement: {}
  InlineJavascriptRequirement: {}

arguments:
  - sqlite3
  - $(inputs.db)
  - $('select json_object(\'parse_string\', parse_string) from current where title="' + inputs.current_title + '";')
  - '.exit'

inputs:
  db:
    type: File

  current_title:
    type: string

stdout: cwl.output.json
outputs:
  parse_string:
    type: string
