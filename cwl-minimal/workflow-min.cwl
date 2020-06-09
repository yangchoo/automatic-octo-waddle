#!/usr/bin/env cwl-runner
# $namespaces: { iana: "https://www.iana.org/assignments/media-types/" }

class: Workflow
cwlVersion: v1.0

inputs:
  initial_params:
    type: File

outputs: []

steps:
  count_cells:
    in:
      params: initial_params
    run: count_cells.cwl
    out:
    - dataref