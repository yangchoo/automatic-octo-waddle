#!/usr/bin/env cwl-runner
# count-cells.cwl

class: CommandLineTool
cwlVersion: v1.0

inputs:
  params:
    type: File
    inputBinding:
      position: 1

outputs: []

baseCommand:
- transcriptic
- launch
- DiluteCells
