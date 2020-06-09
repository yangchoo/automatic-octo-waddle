#!/usr/bin/env cwl-runner
# count-cells.cwl
$namespaces: { iana: "https://www.iana.org/assignments/media-types/" }

class: CommandLineTool
cwlVersion: v1.0
label: DiluteCells Protocol Wrapper

inputs:
  params:
    type: File
    format: iana:application/json
    inputBinding:
      position: 1

outputs: []

baseCommand:
- transcriptic
- launch
- DiluteCells
