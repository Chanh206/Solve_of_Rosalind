# Assign data to a specific variable
input=$(awk "{print $1}" rosalind_gc.txt)
input=$(cat rosalind_gc.txt)
# Use awk to process the sequences and calculate GC content
highest_gc_id=$(echo "$input" | awk '/^>/ {if (seq) {if (gc > max_gc) {max_gc = gc; max_id = id} } id=$0; seq=""; gc=0} !/^>/ {seq = seq $0; gc+=gsub(/[GCgc]/,"")} END {if (gc > max_gc) {max_gc = gc; max_id = id} sub(">", "", max_id); printf "%s\n%.14f\n", max_id, (max_gc/length(seq)*100)}')
echo "$highest_gc_id"


#!/bin/bash

# Read the file line by line
while IFS= read -r line
do
    # Skip lines that start with '>'
    if [[ ! $line =~ ^\>.*$ ]]
    then
        # Calculate each nucleotide type
        a=$(echo $line | grep -o "A" | wc -l)
        t=$(echo $line | grep -o "T" | wc -l)
        g=$(echo $line | grep -o "G" | wc -l)
        c=$(echo $line | grep -o "C" | wc -l)

        echo "A: $a, T: $t, G: $g, C: $c"

        # Calculate GC content
        total=$((a + t + g + c))
        gc=$((g + c))
        gc_content=$(echo "scale=2; $gc / $total * 100" | bc)
        echo "GC Content: $gc_content%"
    fi
done < file.fasta
