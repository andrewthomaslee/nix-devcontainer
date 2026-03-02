# VSCode Devcontainer

## Requirements
- Docker
- VSCode

## Setup
1. Clone this repo
2. Open the repo in VSCode
3. Open the Command Palette (Ctrl+Shift+P)
4. Select `Remote-Containers: Open Folder in Container...`
5. Select the cloned repo
6. Wait for the container to build
7. Open a terminal in VSCode
8. Run `direnv allow`
9. Run `nix develop`


# devcontainer CLI
### Start the Container
```bash
devcontainer up --workspace-folder .
```

### Execute a Command in the Container
```bash
devcontainer exec --workspace-folder . nix develop
```