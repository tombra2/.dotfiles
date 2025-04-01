#!/bin/bash
# Skript zum Starten der Anwendungen in den gewünschten Workspaces auf Monitor DP-0

# Workspaces 3 bis 8 auf DP-0 verschieben

i3-msg 'workspace 1; move workspace to output DVI-D-0'
i3-msg 'workspace 1; exec --no-startup-id google-chrome-stable'
sleep 2.5
i3-msg 'workspace 2; move workspace to output HDMI-0'
i3-msg 'workspace 2; exec --no-startup-id kitty'
sleep 2.5

i3-msg 'workspace 3; move workspace to output DP-4'
i3-msg 'workspace 4; move workspace to output DP-4'
i3-msg 'workspace 5; move workspace to output DP-4'
i3-msg 'workspace 6; move workspace to output DP-4'
i3-msg 'workspace 7; move workspace to output DP-4'
i3-msg 'workspace 8; move workspace to output DP-4'
i3-msg 'workspace 9; move workspace to output DP-4'
sleep 2.5
i3-msg 'workspace 3; exec --no-startup-id spotify'
sleep 2.5
i3-msg 'workspace 4; exec --no-startup-id thunderbird'
sleep 2.5
i3-msg 'workspace 5; exec --no-startup-id discord'
sleep 2.5
i3-msg 'workspace 6; exec --no-startup-id 1password'
sleep 2.5
i3-msg 'workspace 7; exec -- no-startup-id teams.desktop'
sleep 2.5
i3-msg 'workspace 8; exec --no-startup-id zapzap'
sleep 2.5
i3-msg 'workspace 9; exec --no-startup-id com.todoist.Todoist'
sleep 2.5
i3-msg 'workspace 10; move workspace to output HDMI-0'
i3-msg 'workspace 10; exec --no-startup-id google-chrome-stable'
sleep 2.5
