#!/usr/local/bin cwl-runner

cwlVersion: v1.2
class: CommandLineTool

requirements:
  ShellCommandRequirement: {}
  InlineJavascriptRequirement: {}

arguments:
  - sqlite3
  - $(inputs.db)
  - $('select json_object(\'natoms\', count(distinct atom_id)) from atomlist;')
  - '.exit'

inputs:
  db:
    type: File

stdout: cwl.output.json
outputs:
  natoms:
    type: int
    # outputBinding:
    #   glob: natoms.txt
    #   loadContents: true
    #   outputEval: $(parseInt(self[0].contents))
