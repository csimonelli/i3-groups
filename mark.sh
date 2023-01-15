#!/bin/bash

# made with ggtp3 :)
original_name=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).name')  

# Ws ends with *?
if [[ "${original_name}" == *"*" ]]; then
# delete the last *
  modified_name=${original_name%?}
else
  modified_name="${original_name}*"
# Append an *  
fi

i3-msg "rename workspace ${original_name} to ${modified_name}" 