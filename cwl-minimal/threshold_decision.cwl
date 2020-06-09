#!/usr/bin/env cwl-runner
# count-cells.cwl

class: CommandLineTool
cwlVersion: v1.0

inputs:
  dataref:
    type: string  # url
    inputBinding:
      position: 1
  threshold:
    type: int
    inputBinding:
      position: 2

outputs:
  dilute_params:
    type: File
  count_cell_params:
    type: File

baseCommand:
- python
- threshold_decision.py
