#!/bin/sh

#script_path="$( cd -- "$(dirname "$3")" >/dev/null 2>&1 ; pwd -P )"
#echo "$script_path"





SCRIPT=$(realpath -s "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
echo "$SCRIPT"
echo "$SCRIPTPATH"

