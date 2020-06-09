#!/usr/bin/env cwl-runner
# count-cells.cwl

class: CommandLineTool
cwlVersion: v1.1

inputs:
  params:
    type: File
    format: json
    inputBinding:
      position: 1

outputs:
  dataref:
    type: string # url

# Supplement `launch` to return dataref, or have some intermediate script
# which gets that information somehow.
baseCommand:
- transcriptic
- launch
- CountCells
