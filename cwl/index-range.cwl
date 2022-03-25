#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: ExpressionTool

requirements:
  - class: InlineJavascriptRequirement

inputs:
  natoms: int

outputs:
  index_range:
    type: int[]

expression: " ${ var r = [];
                 for (var i = 1; i <= inputs.natoms; i++) {
                   r.push(i);
                 }
                 return {'index_range': r};
               }"
