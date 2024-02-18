#!/bin/bash

# Assign input sequences to array after removing the title lines
input_sequences=$(echo ">Rosalind_1
GATTACA
>Rosalind_2
TAGACCA
>Rosalind_3
ATACA" | grep -v '>' | tr '\n' ' ')

# Function to find the longest common substring
find_longest_common_substring() {
    local sequences="$@"
    local substring=""
    local length=${#sequences}

    for ((i=0; i<length; i++)); do
        for ((j=i+1; j<=length; j++)); do
            candidate=${sequences:i:j-i}
            common=true
            for sequence in $input_sequences; do
                if [[ $sequence != *$candidate* ]]; then
                    common=false
                    break
                fi
            done
            if [[ $common = true && ${#candidate} -gt ${#substring} ]]; then
                substring=$candidate
            fi
        done
    done

    echo $substring
}

# Call the function with the given input sequences
longest_common=$(find_longest_common_substring $input_sequences)
echo "Longest common substring: $longest_common"
