# i3-groups

This script allows you to switch between groups of workspaces without going through groups that you don't want to. 

For example, you can have groups of workspaces with chats/browsers and groups with work-related things. Or if you're working on two different projects, you can switch between them quickly. 

It's also useful when you're sharing your screen and don't want to accidentally share the wrong workspace. 

Currently, it only switches between groups on the same output.

What it actually does is "mark" a workspace with a '\*' at the end of the workspace name using the mark.sh script. Once you have marked workspaces, if the workspace that currently has focus is marked, it will only switch between workspaces that end with '\*'. If the workspaces are not marked, it will only switch between workspaces that don't have the mark. 

If you want to switch between marked and unmarked workspaces, you need to go directly to a marked or unmarked workspace, usually by using the keyboard shortcut mod+1, mod+2, etc.

If you want some workspaces to have the marking behavior by default (for example, for Spotify, WhatsApp), you can give them a name ending with '\*' in the i3 config.

# Config example:

Bindings

```
# Groups
bindsym Control+Mod1+Right exec ~/.config/i3/next.sh
bindsym Control+Mod1+Left exec ~/.config/i3/prev.sh
bindsym $mod+g exec ~/.config/i3/mark.sh
```

Workflow example:

![Workspaces](/pics/1.png "Workspaces")

Next.

![Workspaces](/pics/2.png "Workspaces")

Go to 9.

![Workspaces](/pics/3.png "Workspaces")

Prev.

![Workspaces](/pics/4.png "Workspaces")

