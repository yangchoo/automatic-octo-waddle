{
    "$graph": [
        {
            "class": "CommandLineTool",
            "label": "CountCells Protocol Wrapper",
            "inputs": [
                {
                    "type": "File",
                    "inputBinding": {
                        "position": 1
                    },
                    "id": "#count_cells.cwl/params"
                }
            ],
            "outputs": [
                {
                    "type": "string",
                    "id": "#count_cells.cwl/dataref"
                }
            ],
            "baseCommand": [
                "transcriptic",
                "launch",
                "DiluteCells"
            ],
            "id": "#count_cells.cwl"
        },
        {
            "class": "CommandLineTool",
            "label": "DiluteCells Protocol Wrapper",
            "inputs": [
                {
                    "type": "File",
                    "inputBinding": {
                        "position": 1
                    },
                    "id": "#dilute_cells.cwl/params"
                }
            ],
            "outputs": [],
            "baseCommand": [
                "transcriptic",
                "launch",
                "DiluteCells"
            ],
            "id": "#dilute_cells.cwl"
        },
        {
            "class": "CommandLineTool",
            "inputs": [
                {
                    "type": "string",
                    "inputBinding": {
                        "position": 1
                    },
                    "id": "#threshold_decision.cwl/dataref"
                },
                {
                    "type": "int",
                    "inputBinding": {
                        "position": 2
                    },
                    "id": "#threshold_decision.cwl/threshold"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "id": "#threshold_decision.cwl/dilute_params"
                }
            ],
            "baseCommand": [
                "python",
                "threshold_decision.py"
            ],
            "id": "#threshold_decision.cwl"
        },
        {
            "class": "Workflow",
            "inputs": [
                {
                    "type": "File",
                    "id": "#main/initial_params"
                },
                {
                    "type": "int",
                    "id": "#main/threshold"
                }
            ],
            "outputs": [],
            "steps": [
                {
                    "in": [
                        {
                            "source": "#main/initial_params",
                            "id": "#main/count_cells/params"
                        }
                    ],
                    "run": "#count_cells.cwl",
                    "out": [
                        "#main/count_cells/dataref"
                    ],
                    "id": "#main/count_cells"
                },
                {
                    "in": [
                        {
                            "source": "#main/threshold_decision/dilute_params",
                            "id": "#main/dilute_cells/params"
                        }
                    ],
                    "run": "#dilute_cells.cwl",
                    "out": [],
                    "id": "#main/dilute_cells"
                },
                {
                    "in": [
                        {
                            "source": "#main/count_cells/dataref",
                            "id": "#main/threshold_decision/dataref"
                        },
                        {
                            "source": "#main/threshold",
                            "id": "#main/threshold_decision/threshold"
                        }
                    ],
                    "run": "#threshold_decision.cwl",
                    "out": [
                        "#main/threshold_decision/dilute_params"
                    ],
                    "id": "#main/threshold_decision"
                }
            ],
            "id": "#main"
        }
    ],
    "cwlVersion": "v1.0"
}