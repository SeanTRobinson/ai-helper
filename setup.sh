#!/bin/bash
# Bash setup script for ai-helper submodule
# Usage: Run this script after adding the submodule to your repo

set -e

printf "[ai-helper] Starting setup...\n"

# Detect IDE and set instructions folder
if [ "$TERM_PROGRAM" = "vscode" ]; then
  instructions_path=".copilot/instructions"
  printf "[ai-helper] Detected VS Code. Using $instructions_path.\n"
elif [ ! -z "$CURSOR" ]; then
  instructions_path=".cursor/instructions"
  printf "[ai-helper] Detected Cursor. Using $instructions_path.\n"
else
  instructions_path=".copilot/instructions"
  printf "[ai-helper] IDE not detected, defaulting to $instructions_path.\n"
fi

# Create instructions folder if it doesn't exist
if [ ! -d "$instructions_path" ]; then
  mkdir -p "$instructions_path"
  printf "[ai-helper] Created $instructions_path folder.\n"
fi

# Add reference file
cat <<EOT > "$instructions_path/ai-helper-submodule.md"
# AI Helper Submodule Reference

This project uses the ai-helper submodule for automation and persona management.

- The ai-helper rules and instructions are available in the submodule's instructions folder.
- To extend or override, add your own markdown or mdc files here referencing the submodule as needed.

Example:
- [ai-helper instructions](../ai-helper/.copilot/instructions/) (if submodule is at ai-helper/)
EOT

printf "[ai-helper] Reference file created at $instructions_path/ai-helper-submodule.md\n"
printf "[ai-helper] Setup complete! Review the reference file for next steps.\n"
