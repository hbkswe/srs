## CLion SOP: index SRS as Makefiles project (WSL) - Henry personal testing note

SRS is built via the `configure` script, which generates Makefiles. CLion indexes best when it loads the **generated Makefile project** (not `compile_commands.json`).

### Steps
1. **Generate Makefiles**
    - Run the SRS `configure` script (no special arguments needed) so it creates the Makefile(s) under your `trunk/` directory.

2. **Remove CLion project metadata**
    - Delete `trunk/.idea/` if it exists.

3. **Reset the CLion project**
    - Close the project in CLion.
    - Remove the old project config (delete the CLion project files in `trunk` as needed).

4. **Open CLion from `trunk/`**
    - Open the project **at the `trunk/` folder**.
    - Point CLion to the main `Makefile` in `trunk/` (the “major” Makefile).  
      Minor Makefiles in `objs/` are typically created/used during the build process.

5. **Let CLion clean/reload**
    - When CLion prompts for **Clean/Reload**, accept it.

6. **Verify indexing**
    - Open `Tools → Build` and confirm CLion loads the Makefile project model.
    - If loading is correct, symbol navigation/definitions should resolve cleanly.

### Expected result
- CLion indexes sources and resolves symbols (headers/functions across files) reliably.