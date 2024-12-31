#!/bin/bash

# Define variables
TEST_PROJECT="../Tailspin.SpaceGame.Web.Tests/Tailspin.SpaceGame.Web.Tests.csproj"
OUTPUT_DIR="../TestResults/Coverage"
CONFIGURATION="Release"

# Create the output directory if it doesn't exist
mkdir -p $OUTPUT_DIR

# Check if the project file exists
if [ ! -f "$TEST_PROJECT" ]; then
  echo "Error: Test project file not found at $TEST_PROJECT"
  exit 1
fi

# Run the dotnet test command
dotnet test "$TEST_PROJECT" --no-build \
  --configuration $CONFIGURATION \
  -p:CollectCoverage=true \
  -p:CoverletOutputFormat=cobertura \
  -p:CoverletOutput="$OUTPUT_DIR/"

# Check if the command succeeded
if [ $? -eq 0 ]; then
    echo "Tests completed successfully. Coverage report saved to $OUTPUT_DIR."
else
    echo "Tests failed. Check the output above for details."
    exit 1
fi
