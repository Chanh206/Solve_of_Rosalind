#!/bin/bash
awk '{
    if ($1 ~ /^>/) {
        if (seq != "") {
            printf("%s\n%s\n", header, seq)
            seq=""
        }
        header = $0
    } else {
        seq = seq""$0
    }
} END {
    if (seq != "") {
        printf("%s\n%s\n", header, seq)
    }
}' input.fasta
