#!/usr/bin/env cwl-runner
# count-cells.cwl

class: CommandLineTool
cwlVersion: v1.0
label: CountCells Protocol Wrapper

inputs:
  sample:
    type: string  # aliquot
    default: "none"  # for first run
    inputBinding:
      position: 1
  not_execute:
    type: boolean
    default: false
    inputBinding:
      position: 2

outputs:
  cell_count:
    type: int
  cell_viability:
    type: float
  cell_conc: 
    type: float

baseCommand:
- python
- submit_count_cells_and_wait.py