#!/usr/bin/env cwl-runner
# count-cells.cwl

class: CommandLineTool
cwlVersion: v1.0
label: Dilute or CountCell

inputs:
  num_live_cell:
    type: int
    inputBinding:
      position: 1
  cell_viability:
    type: float
    inputBinding:
      position: 2
  cell_conc:
    type: float
    inputBinding:
      position: 3
  cell_viability_cutoff:
    type: float
    inputBinding:
      position: 4
  cell_conc_cutoff:
    type: int
    inputBinding:
      position: 5

outputs:
  target_count:
    type: int
  sample_count:
    type: int
  sample_aliquot:
    type: string  # aliquot type
  run_dilute:
    type: boolean

baseCommand:
- python
- threshold_decision.py
