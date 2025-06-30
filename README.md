# ai-helper
A submodule to be included in projects that contains a variety of helpful prompts and personas.

## Quick Start: Add ai-helper as a Submodule

To add the ai-helper to your project:

1. Add the submodule:
   ```sh
   git submodule add <repo-url> ai-helper
   ```
   Replace `<repo-url>` with the actual repository URL for ai-helper.

2. Run the setup script for your OS:
   - **On Windows:**
     ```powershell
     powershell -ExecutionPolicy Bypass -File ./ai-helper/setup.ps1
     ```
   - **On Mac/Linux:**
     ```bash
     bash ./ai-helper/setup.sh
     ```

3. The script will:
   - Detect your IDE (VS Code or Cursor)
   - Set up the correct instructions/rules folder
   - Create a reference doc linking to the ai-helper submodule’s instructions

4. Review the reference file in your `.copilot/instructions` or `.cursor/instructions` folder for next steps and extension points.

---

For more details, see the reference file created by the setup script or explore the ai-helper submodule’s documentation.
