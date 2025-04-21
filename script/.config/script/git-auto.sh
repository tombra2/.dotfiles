#!/bin/bash

# Git Status prüfen
if git diff --quiet && git diff --cached --quiet; then
    echo "✅ Working Tree ist sauber. Nichts zu tun."
else
    echo "⚠️ Änderungen erkannt. Füge Dateien hinzu..."
    git add .

    # Commit Message abfragen
    read -p "💬 Commit-Nachricht eingeben: " commit_message

    # Commit ausführen
    git commit -m "$commit_message"

    # Push auf Remote
    git push
fi
