#!/usr/bin/env cwl-runner
# count-cells.cwl

class: CommandLineTool
cwlVersion: v1.1

inputs:
  decision:
    type: boolean
    inputBinding:
      position: 1

outputs: []

baseCommand:
- transcriptic
- launch
- DiluteCells
