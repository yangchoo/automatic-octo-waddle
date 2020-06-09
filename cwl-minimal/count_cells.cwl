#!/usr/bin/env cwl-runner
# count-cells.cwl

class: CommandLineTool
cwlVersion: v1.0

inputs:
  params:
    type: File
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
