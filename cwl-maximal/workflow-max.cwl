#!/usr/bin/env cwl-runner

class: Workflow
cwlVersion: v1.0

inputs:
  cell_viability_cutoff: float
  cell_conc_cutoff: int

outputs: []

steps:
  count_cells:
    run: count_cells.cwl
    in: []
    out:
    - cell_count
    - cell_viability
    - cell_conc
  
  threshold_decision:
    run: threshold_decision.cwl
    in:
      num_live_cell: count_cells/cell_count
      cell_viability: count_cells/cell_viability
      cell_conc: count_cells/cell_conc
      cell_viability_cutoff: cell_viability_cutoff
      cell_conc_cutoff: cell_conc_cutoff
    out:
    - target_count
    - sample_count
    - sample_aliquot
    - run_dilute
  
  dilute_cells:
    in:
      target_count: threshold_decision/target_count
      sample_count: threshold_decision/sample_count
      sample_aliquot: threshold_decision/sample_aliquot
      run_dilute: threshold_decision/run_dilute
    run: dilute_cells.cwl
    out: []

  count_cells_2:
    run: count_cells.cwl
    in:
      sample: threshold_decision/sample_aliquot
      not_execute: threshold_decision/run_dilute
    out:
    - cell_count
    - cell_viability
    - cell_conc
  
  threshold_decision_2:
    run: threshold_decision.cwl
    in:
      num_live_cell: count_cells_2/cell_count
      cell_viability: count_cells_2/cell_viability
      cell_conc: count_cells_2/cell_conc
      cell_viability_cutoff: cell_viability_cutoff
      cell_conc_cutoff: cell_conc_cutoff
    out:
    - target_count
    - sample_count
    - sample_aliquot
    - run_dilute
  
  dilute_cells_2:
    in:
      target_count: threshold_decision_2/target_count
      sample_count: threshold_decision_2/sample_count
      sample_aliquot: threshold_decision_2/sample_aliquot
      run_dilute: threshold_decision_2/run_dilute
    run: dilute_cells.cwl
    out: []