#!/usr/bin/env cwl-runner
# $namespaces: { iana: "https://www.iana.org/assignments/media-types/" }

class: Workflow
cwlVersion: v1.0

inputs:
  initial_params:
    type: File
  threshold:
    type: int

outputs: []

steps:
  count_cells:
    in:
      params: initial_params
    run: count_cells.cwl
    out:
    - dataref
  dilute_cells:
    in:
      params: threshold_decision/dilute_params
    run: dilute_cells.cwl
    out: []
  threshold_decision:
    in:
      dataref: count_cells/dataref
      threshold: threshold
    run: threshold_decision.cwl
    out:
    - dilute_params
