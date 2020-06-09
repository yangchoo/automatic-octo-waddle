#!/usr/bin/env cwl-runner
# count-cells.cwl

class: CommandLineTool
cwlVersion: v1.0
label: DiluteCells Protocol Wrapper

inputs:
  target_count:
    type: int
    default: 10000
    inputBinding:
      position: 1
  sample_count:
    type: int
  sample_aliquot:
    type: string  # technically aliquot-type
  run_dilute:
    type: boolean  # decision on whether to run dilute
    default: false

outputs: []

baseCommand:
- python
- submit_dilute_cells_and_wait.py
