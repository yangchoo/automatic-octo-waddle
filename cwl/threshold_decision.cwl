#!/usr/bin/env cwl-runner
# count-cells.cwl

class: CommandLineTool
cwlVersion: v1.1

inputs:
  cell_count:
    type: string
    inputBinding:
      position: 1
  threshold:
    type: int
    inputBinding:
      position: 2

outputs:
  dilute_decision:
    doc: decision variable
    type: boolean

baseCommand:
- python
- threshold_decision.py
