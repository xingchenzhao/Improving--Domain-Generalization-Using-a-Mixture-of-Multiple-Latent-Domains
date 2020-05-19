#!/bin/bash

domain=("photo" "art" "cartoon" "sketch")

times=10
for i in `seq 1 $times`
do
    max=$((${#domain[@]}-1))
    for j in `seq 0 $max`
    do
    dir_name="PACS/default/${domain[j]}${i}"
    echo $dir_name
    python ../main/main.py \
        --data-root='../data/pacs/kfold/' \
        --save-root='../data/result/general_original' \
        --result-dir=$dir_name \
        --train='general' \
        --data='PACS' \
        --model='caffenet' \
        --entropy='default' \
        --exp-num=$j \
        --gpu=2 \
        --num-epoch=30 \
        --scheduler='step' \
        --lr=1e-3 \
        --lr-step=24 \
        --lr-decay-gamma=0.1 \
        --nesterov \
        --fc-weight=10.0 \
        --disc-weight=10.0 \
        --entropy-weight=1.0 \
        --grl-weight=1.0 \
        --loss-disc-weight \
        --color-jitter \
        --min-scale=0.8 \
        --instance-stat \
        --wandb-proj-name=Mat_General_Original \
        --wandb-run-name=_run${i} 
    done
done