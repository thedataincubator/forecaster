#!/bin/bash
################################################################################
#
# @author: Jonathan Lai
# @date: 7/2/2018
# @version: 0.1
#
# Here is a script to extract version numbers from your 
# conda-requirements.txt file after installing the libraries into your conda
# environment.
#
# To run this script, type the following:
#    /bin/bash grabVersion.sh conda-requirements.txt > new-conda-requirements.txt
#
# After running the script, you new-conda-requirements will contain an updated
# conda-requirements.txt file. If you add any new libraries to the build, please
# remember to update your conda-requirements.txt file before pushing your changes
# into git.
#
################################################################################
while IFS='' read -r line || [[ -n "$line" ]]; do
    if [[ $line = *"=="* ]]; then
	echo $line
    else
	conda list | grep $line | awk '{ print $1"=="$2 }'
    fi
done < "$1"
