#!/bin/bash

# Get the name and output of the currently focused workspace
current_workspace=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true)')
current_name=$(echo "$current_workspace" | jq '.name' | cut -d"\"" -f2)
current_output=$(echo "$current_workspace" | jq '.output' | cut -d"\"" -f2)

# Get the names of all workspaces on the same output
mapfile -t workspaces < <(i3-msg -t get_workspaces | jq ".[] | select(.output == \"$current_output\") | .name" | cut -d"\"" -f2)

# Find the current workspace in the list of workspaces
current_index=-1
index=0
for workspace in "${workspaces[@]}"
do
    if [ "$workspace" == "$current_name" ]
    then
        current_index=$index
        break
    fi
    ((index++))
done

# Check if the current workspace's name ends with *
if [[ "$current_name" == *"*" ]]
then
    # Find the next workspace on the same output whose name ends with *
    next_index=1000
    for ((i=current_index-1; i>=0; i--))
    do

        if [[ "${workspaces[i]}" == *"*" ]]
        then
        
            echo aca
            next_index=$i
            break
        fi
    done

    # If no such workspace was found, start from the beginning of the list
    if [ $next_index -eq 1000 ]
    then
        for ((i=${#workspaces[@]}-1; i>current_index; i--))
        do
            if [[ "${workspaces[i]}" == *"*" ]]
            then
                next_index=$i
                break
            fi
        done
    fi
else
    # Find the next workspace on the same output whose name does not end with *
    next_index=1000
    for ((i=current_index-1; i>=0; i--))
    do
        if [[ "${workspaces[i]}" != *"*" ]]
        then
            next_index=$i
            break
        fi
    done

    # If no such workspace was found, start from the beginning of the list
    if [ $next_index -eq 1000 ]
    then
        for ((i=${#workspaces[@]}-1; i>current_index; i--))
        do
            if [[ "${workspaces[i]}" != *"*" ]]
            then
                next_index=$i
                break
            fi
        done
    fi
fi

# If a workspace was found, focus it
if [ -n "$next_index" ]
then
    i3-msg workspace "${workspaces[next_index]}"
fi