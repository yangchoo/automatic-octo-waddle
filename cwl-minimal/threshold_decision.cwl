#!/usr/bin/env cwl-runner
# count-cells.cwl
$namespaces: { iana: "https://www.iana.org/assignments/media-types/" }

class: CommandLineTool
cwlVersion: v1.0
label: Threshold Program

inputs:
  dataref:
    type: string  # url
    inputBinding:
      position: 1
  threshold:
    type: int
    inputBinding:
      position: 2

outputs:
  dilute_params:
    type: File
    format: iana:application/json
  count_cell_params:
    type: File
    format: iana:application/json    

baseCommand:
- python
- threshold_decision.py
