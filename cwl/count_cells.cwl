#!/usr/bin/env cwl-runner
# count-cells.cwl

cwlVersion: v1.1
class: CommandLineTool
baseCommand: ["transcriptic", "launch", "CountCells"]
inputs:
  ref:
    type: string
    inputBinding:
      position: 1
  decision:
    type: boolean
    default: true
    inputBinding:
      prefix: "-b"
outputs:
  count_cells_dataset:
    type: string
