#!/usr/bin/env cwl-runner
# count-cells.cwl
$namespaces: { iana: "https://www.iana.org/assignments/media-types/" }

class: CommandLineTool
cwlVersion: v1.0
label: CountCells Protocol Wrapper

inputs:
  params:
    type: File
    format: iana:application/json
    inputBinding:
      position: 1

outputs:
  run_id:
    type: string # RunId

# Supplement `launch` to return dataref, or have some intermediate script
# which gets that information somehow.
baseCommand:
- transcriptic
- launch
- CountCells
