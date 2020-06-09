#!/usr/bin/env cwl-runner
# count-cells.cwl
# $namespaces: { iana: "https://www.iana.org/assignments/media-types/" }

class: CommandLineTool
cwlVersion: v1.0
label: CountCells Protocol Wrapper

inputs:
  params:
    type: File
    inputBinding:
      position: 1

outputs:
  dataref:
    type: string

baseCommand:
- someCountCells.py
