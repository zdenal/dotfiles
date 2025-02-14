#!/bin/bash

CURSOR_CONFIG_PATH="$HOME/Library/Application Support/Cursor/User" # macOS

BACKUP_REPO_PATH="$HOME/Projects/dotfiles/cursor_ai_backup"

cd "$BACKUP_REPO_PATH" || exit

cp "$CURSOR_CONFIG_PATH/settings.json" "$BACKUP_REPO_PATH/settings.json"
cp "$CURSOR_CONFIG_PATH/keybindings.json" "$BACKUP_REPO_PATH/keybindings.json"

code --list-extensions > extensions.txt
cp "$CURSOR_CONFIG_PATH/extensions.txt" "$BACKUP_REPO_PATH/extensions.txt"
#restore extensions: cat extensions.txt | xargs -n 1 code --install-extension


# Zkopírujte složku se snippets, pokud existuje
if [ -d "$CURSOR_CONFIG_PATH/snippets" ]; then
  cp -r "$CURSOR_CONFIG_PATH/snippets" "$BACKUP_REPO_PATH/snippets"
fi

git add .
git commit -m "Backup Cursor AI: $(date)"
git push origin master

# Hotovo!
echo "Backup finished."
