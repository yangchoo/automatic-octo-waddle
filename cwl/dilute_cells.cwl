#!/usr/bin/env cwl-runner
# count-cells.cwl

cwlVersion: v1.1
class: CommandLineTool
baseCommand: ["transcriptic", "launch", "DiluteCells"]
inputs:
  decision:
    type: boolean
    inputBinding:
      position: 1
outputs: []
