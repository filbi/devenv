def Settings(**kwargs):
    if kwargs["language"] == "rust":
        return {
            "ls": {
                "rust-analyzer": {
                    "diagnostics": {
                        "disabled": ["inactive-code", "unresolved-proc-macro"]
                    },
                    "checkOnSave": {
                        "command": "clippy",
                        "allFeatures": True,
                        "extraArgs": [
                            "--",
                            "-Dwarnings",
                            "-Dclippy::all",
                            "-Dclippy::pedantic",
                            "-Dclippy::indexing-slicing",
                            "-Aclippy::missing-errors-doc",
                            "-Aclippy::missing-panics-doc",
                        ],
                    },
                },
            }
        }
