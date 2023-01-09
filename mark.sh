#!/bin/bash

# Lo hice con chat ggtp3
original_name=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).name')  

# Comprobamos si la variable termina con el caracter *
if [[ "${original_name}" == *"*" ]]; then
  # Si termina con *, eliminamos el último caracter de la variable
  modified_name=${original_name%?}
else
  # Si no termina con *, añadimos el caracter al final de la variable
  modified_name="${original_name}*"
fi

i3-msg "rename workspace ${original_name} to ${modified_name}" 