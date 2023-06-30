#!/bin/bash

# Extract comments from a YAML file into CSV 

if [[ $# -eq 0 ]]; then
  echo "Usage: $0 <INPUT_YAML_FILE>"
  exit 1
fi

INPUT_FILE="$1"
CSV_FILE="${INPUT_FILE%.*}.csv"

# Check if yq is installed
command -v yq > /dev/null 2>&1 || { echo "yq is not installed. Please install it and try again: https://github.com/mikefarah/yq/#install" >&2; exit 1; }

# Extract headComments and lineComments comments using yq
# awk removes lines where no comments are found
yq '[... | {"YAML path": path | join("."), "Description": headComment + lineComment}]' "$INPUT_FILE" -o=csv | awk '!/^[a-zA-Z0-9\-\.]+,$/' > $CSV_FILE

echo "Comments extracted and saved to $CSV_FILE."
