#!/bin/bash
# OpenCycler Setup and Launch Script
# Creates a virtual environment if needed and launches the GUI
# Cross-platform: Linux, macOS, Windows (Git Bash)

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
VENV_DIR="$SCRIPT_DIR/venv"

# Detect OS and set executable paths
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    PYTHON_CMD="python"
    PIP_CMD="$VENV_DIR/Scripts/pip.exe"
    PYTHON_EXE="$VENV_DIR/Scripts/python.exe"
else
    PYTHON_CMD="python3"
    PIP_CMD="$VENV_DIR/bin/pip"
    PYTHON_EXE="$VENV_DIR/bin/python"
fi

echo "OpenCycler Setup"
echo "================"
echo "Platform: $OSTYPE"
echo ""

if [ ! -d "$VENV_DIR" ]; then
    echo "Creating virtual environment..."
    $PYTHON_CMD -m venv "$VENV_DIR"
    echo "Virtual environment created."
else
    echo "Virtual environment already exists."
fi

echo "Upgrading pip..."
$PIP_CMD install --upgrade pip --quiet

echo "Installing/updating OpenCycler..."
$PIP_CMD install --upgrade "$SCRIPT_DIR" --quiet

echo ""
echo "Launching OpenCycler GUI..."
$PYTHON_EXE "$SCRIPT_DIR/src/opencycler_gui.py"
