#! /usr/bin/env bash

datasets='/Users/test/GitHub/ProblemSet1/problem-set-1/problem-set-1/data-sets'
#Which state in states.tab.gz has the lowest murder rate?

states="$datasets/misc/states.tab.gz"

answer_1=$(gzcat $states \
    |grep -v '^#' \
    |cut -f 1,6 \
    |sort -k2n \
    |head -n1 \
    |cut -f 1 \
    |sed 's/"//g')

echo "answer_1: $answer_1" > answers.yml

#How many sequence records are in the sample.fa file?

seqrecords="$datasets/fasta/sample.fa"

answer_2=$(cat $seqrecords \
    |grep -c '>')

echo "answer_2: $answer_2" >> answers.yml

#How many unique CpG IDs are in cpg.bed.gz?

cpg="$datasets/bed/cpg.bed.gz"

answer_3=$(gzcat $cpg \
    |cut -f 4 \
    |sort \
    |uniq -c \
    |wc -l)

echo "answer_3: $answer_3" >> answers.yml

#How many sequence records are in the SP1.fq file?

sequencerecords="$datasets/fastq/SP1.fq"

answer_4=$(cat $sequencerecords \
    |grep -c '^+$')

echo "answer_4: $answer_4" >> answers.yml

#How many words are on lines containing the word bloody in hamlet.txt?
#(Hint: use wc to count words).

bloody="$datasets/misc/hamlet.txt"

answer_5=$(cat $bloody \
    |grep -i "bloody" \
    |wc -w)

echo "answer_5: $answer_5" >> answers.yml

#What is the length of the sequence in the first record of sample.fa?
#(Hint: use wc to count characters).

sequencelength="$datasets/fasta/sample.fa"

answer_6=$(cat $sequencelength \
    |grep -v '^>' $sequencelength \
    |head -n1 \
    |tr -d '\n' \
    |wc -m)

echo "answer_6: $answer_6" >> answers.yml

#What is the name of the longest gene in genes.hg19.bed.gz?

longestgene="$datasets/bed/genes.hg19.bed.gz"

answer_7=$(gzcat $longestgene \
    |awk '{print$4, $3-$2}' \
    |sort -k2nr \
    |head -n1 \
    |cut -d\  -f1)

echo "answer_7: $answer_7" >> answers.yml

#How many unique chromosomes are in genes.hg19.bed.gz?

uniquechromosomes="$datasets/bed/genes.hg19.bed.gz"

answer_8=$(gzcat $uniquechromosomes \
    |cut -f1 \
    |sort \
    |uniq \
    |wc -l)

echo "answer_8: $answer_8" >> answers.yml

#How many intervals are associated with CTCF (not CTCFL) in
#peaks.chr22.bed.gz?

intervals="$datasets/bed/peaks.chr22.bed.gz"

answer_9=$(gzcat $intervals \
    |cut -f4 \
    |grep '^CTCF$' \
    |wc -l)

echo "answer_9: $answer_9" >> answers.yml

#On what chromosome is the largest interval in lamina.bed?

chrname="$datasets/bed/lamina.bed"

answer_10=$(cat $chrname \
    |awk '{print$1, $3-$2}' \
    |sort -k2nr \
    |head -n1 \
    |cut -d\  -f1)

echo "answer_10: $answer_10" >> answers.yml


