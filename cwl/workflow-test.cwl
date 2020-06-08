#!/usr/bin/env cwl-runner

cwlVersion: v1.1
class: Workflow
inputs:
  threshold: int
  ref: string

outputs: []

steps:
  count_cells:
    run: count_cells.cwl
    in:
      ref: ref
    out: [count_cells_dataset]

  threshold_decision:
    run: threshold_decision.cwl
    in:
      cell_count: count_cells/count_cells_dataset
      threshold: threshold
    out: [dilute_decision]

  count_cells_maybe:
    run: count_cells.cwl
    in:
      ref: ref
      decision: threshold_decision/dilute_decision
    out: [count_cells_dataset]

  threshold_decision_2:
    run: threshold_decision.cwl
    in:
      cell_count: count_cells_maybe/count_cells_dataset
      threshold: threshold
    out: [dilute_decision]

  dilute_cells:
    run: dilute_cells.cwl
    in:
      decision: threshold_decision/dilute_decision
    out: []

  dilute_cells_2:
    run: dilute_cells.cwl
    in:
      decision: threshold_decision_2/dilute_decision
    out: []
