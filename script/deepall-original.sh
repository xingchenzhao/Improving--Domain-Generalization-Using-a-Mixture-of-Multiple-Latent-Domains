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
        --save-root='../data/result/deep_all_original' \
        --result-dir=$dir_name \
        --train='deepall' \
        --data='PACS' \
        --model='caffenet' \
        --exp-num=$j \
        --gpu=1 \
        --num-epoch=30 \
        --scheduler='step' \
        --lr=1e-3 \
        --lr-step=24 \
        --lr-decay-gamma=0.1 \
        --nesterov \
        --fc-weight=10.0 \
        --color-jitter \
        --min-scale=0.8 \
        --wandb-proj-name=Mat_Deepall_Original \
        --wandb-run-name=__run${i} 
    done
done