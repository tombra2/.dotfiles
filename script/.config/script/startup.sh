#!/bin/bash
# Workspaces auf HDMI-0 verschieben
for i in {1..10}; do
    i3-msg "workspace $i; move workspace to output HDMI-0"
done

# Anwendungen starten
i3-msg 'workspace 1; exec --no-startup-id google-chrome-stable'
sleep 5
i3-msg 'workspace 2; exec --no-startup-id kitty'
sleep 5
i3-msg 'workspace 3; exec --no-startup-id spotify'
sleep 1
i3-msg 'workspace 4; exec --no-startup-id thunderbird'
sleep 5
i3-msg 'workspace 5; exec --no-startup-id discord'
sleep 5
i3-msg 'workspace 6; exec --no-startup-id 1password'
sleep 5
i3-msg 'workspace 7; exec --no-startup-id com.github.IsmaelMartinez.teams_for_linux'
sleep 5
i3-msg 'workspace 8; exec --no-startup-id zapzap'
sleep 5
i3-msg 'workspace 9; exec --no-startup-id com.todoist.Todoist'
sleep 5
i3-msg 'workspace 10; exec --no-startup-id google-chrome-stable --new-window'
