#!/usr/bin/env bash

#---------------------------------------------------------
# some useful functions
#---------------------------------------------------------

function count() {
	cat - | sed '/^[ \t]*$/d' | sort | uniq -c | sed 's/^ *//'
}

function column_to_lines() {
	cat - | sed 's/^ *$/#/g' | tr '\n' ' ' | sed 's/ # /\n/g'
}

#---------------------------------------------------------
# prepare the training and test data
#---------------------------------------------------------

# make folder where to store the files
this=$(dirname $0)
data_raw="$this/../data_raw"
data="$this/../data"
mkdir -p $data

# merge features and concept tags togheter
for type in "train" "test"; do
	paste $data_raw/NLSPARQL.$type.feats.txt $data_raw/NLSPARQL.$type.data | cut -f 1,2,3,5 > $data/$type.txt
done
