#!/usr/bin/env cwl-runner
$namespaces: { iana: "https://www.iana.org/assignments/media-types/" }

class: Workflow
cwlVersion: v1.0

inputs:
  initial_params: 
    type: File
    format: iana:application/json
  threshold: int

outputs: []

steps:
  count_cells:
    in:
      params: initial_params
    run: count_cells.cwl
    out:
    - dataref
  
  threshold_decision:
    in:
      dataref: count_cells/dataref
      threshold: threshold
    run: threshold_decision.cwl
    out:
    - dilute_params
    - count_cell_params
  
  dilute_cells:
    in:
      params: threshold_decision/dilute_params
    run: dilute_cells.cwl
    out: []

  count_cells_maybe:
    in:
      params: threshold_decision/count_cell_params
    run: count_cells.cwl
    out:
    - dataref

  threshold_decision_2:
    in:
      dataref: count_cells_maybe/dataref
      threshold: threshold
    run: threshold_decision.cwl
    out:
    - dilute_params
    - count_cell_params  
  
  dilute_cells_2:
    in:
      params: threshold_decision_2/dilute_params
    run: dilute_cells.cwl
    out: []
