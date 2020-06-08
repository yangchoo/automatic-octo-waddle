#!/usr/bin/env cwl-runner

class: Workflow
cwlVersion: v1.1

inputs:
  ref: string
  threshold: int

outputs: []

steps:
  count_cells:
    in:
      ref: ref
    run: count_cells.cwl
    out:
    - count_cells_dataset
  threshold_decision:
    in:
      cell_count: count_cells/count_cells_dataset
      threshold: threshold
    run: threshold_decision.cwl
    out:
    - dilute_decision
  dilute_cells:
    in:
      decision: threshold_decision/dilute_decision
    run: dilute_cells.cwl
    out: []
  count_cells_maybe:
    in:
      decision: threshold_decision/dilute_decision
      ref: ref
    run: count_cells.cwl
    out:
    - count_cells_dataset
  threshold_decision_2:
    in:
      cell_count: count_cells_maybe/count_cells_dataset
      threshold: threshold
    run: threshold_decision.cwl
    out:
    - dilute_decision    
  dilute_cells_2:
    in:
      decision: threshold_decision_2/dilute_decision
    run: dilute_cells.cwl
    out: []
