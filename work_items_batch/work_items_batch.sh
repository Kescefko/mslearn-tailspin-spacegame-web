#!/bin/bash

# Array of work item titles
titles=(
  "Stabilize the build server"
  "Create a Git-based workflow"
  "Create unit tests"
  "Check code for vulnerabilities"
  "Check open source code for vulnerabilities and licensing terms"
  "Move model data to its own package"
  "Investigate hosted vs private build servers"
)

# Loop through titles and create work items
for title in "${titles[@]}"
do
  az boards work-item create --type Task --title "$title" --description "Add more details here if necessary."
done
