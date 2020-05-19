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
        --save-root='../data/result/general_true_d_label_only_color_jitter_no_eloss_no_dlw/' \
        --result-dir=$dir_name \
        --train='general' \
        --data='PACS' \
        --model='caffenet' \
        --entropy='default' \
        --exp-num=$j \
        --gpu=0 \
        --num-epoch=30 \
        --scheduler='step' \
        --lr=1e-3 \
        --lr-step=24 \
        --lr-decay-gamma=0.1 \
        --nesterov \
        --fc-weight=10.0 \
        --disc-weight=10.0 \
        --entropy-weight=0 \
        --grl-weight=1.0 \
        --color-jitter \
        --only-color-jitter \
        --wandb-proj-name=Mat_domain_adv_true_d_label_only_color_jitter_no_eloss_no_d_dlw \
        --wandb-run-name=__run${i} 
    done
done