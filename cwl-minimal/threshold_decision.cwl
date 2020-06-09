#!/usr/bin/env cwl-runner
# count-cells.cwl
# $namespaces: { iana: "https://www.iana.org/assignments/media-types/" }

class: CommandLineTool
cwlVersion: v1.0

inputs:
  dataref:
    type: string
    inputBinding:
      position: 1
  threshold:
    type: int
    inputBinding:
      position: 2

outputs:
  dilute_params:
    type: File

baseCommand:
- threshold_decision.py
