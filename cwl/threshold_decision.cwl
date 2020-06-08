#!/usr/bin/env cwl-runner
# count-cells.cwl

cwlVersion: v1.1
class: CommandLineTool
baseCommand: ["python", "threshold_decision.py"]
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
    type: boolean
    doc: "decision variable"
