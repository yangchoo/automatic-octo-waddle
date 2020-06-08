#!/usr/bin/env cwl-runner
# count-cells.cwl

class: CommandLineTool
cwlVersion: v1.1

inputs:
  decision:
    type: boolean
    default: true
    inputBinding:
      prefix: -b
  ref:
    type: string
    inputBinding:
      position: 1

outputs:
  count_cells_dataset:
    type: string

baseCommand:
- transcriptic
- launch
- CountCells
