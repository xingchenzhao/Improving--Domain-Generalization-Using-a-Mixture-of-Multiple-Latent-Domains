#!/bin/bash

domain=("photo" "art" "cartoon" "sketch")

times=2
for i in `seq 1 $times`
do
    max=$((${#domain[@]}-1))
    for j in `seq 0 $max`
    do
    dir_name="PACS/default/${domain[j]}${i}"
    echo $dir_name
    python ../main/main.py \
        --data-root='../data/pacs/kfold/' \
        --save-root='../data/d_f/result_d_f_vat_eps8/' \
        --result-dir=$dir_name \
        --train='general' \
        --data='PACS' \
        --model='caffenet' \
        --clustering \
        --clustering-method='Kmeans' \
        --num-clustering=3 \
        --clustering-step=1 \
        --entropy='default' \
        --exp-num=$j \
        --gpu=0 \
        --num-epoch=60 \
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
        --vat-eps=8
    done
done

for i in `seq 1 $times`
do
    max=$((${#domain[@]}-1))
    for j in `seq 0 $max`
    do
    dir_name="PACS/default/${domain[j]}${i}"
    echo $dir_name
    python ../main/main.py \
        --data-root='../data/pacs/kfold/' \
        --save-root='../data/d_f/result_d_f_vat_eps30/' \
        --result-dir=$dir_name \
        --train='general' \
        --data='PACS' \
        --model='caffenet' \
        --clustering \
        --clustering-method='Kmeans' \
        --num-clustering=3 \
        --clustering-step=1 \
        --entropy='default' \
        --exp-num=$j \
        --gpu=0 \
        --num-epoch=60 \
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
        --vat-eps=30
    done
done

for i in `seq 1 $times`
do
    max=$((${#domain[@]}-1))
    for j in `seq 0 $max`
    do
    dir_name="PACS/default/${domain[j]}${i}"
    echo $dir_name
    python ../main/main.py \
        --data-root='../data/pacs/kfold/' \
        --save-root='../data/d_f/result_d_f_vat_eps60/' \
        --result-dir=$dir_name \
        --train='general' \
        --data='PACS' \
        --model='caffenet' \
        --clustering \
        --clustering-method='Kmeans' \
        --num-clustering=3 \
        --clustering-step=1 \
        --entropy='default' \
        --exp-num=$j \
        --gpu=0 \
        --num-epoch=60 \
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
        --vat-eps=60
    done
done

for i in `seq 1 $times`
do
    max=$((${#domain[@]}-1))
    for j in `seq 0 $max`
    do
    dir_name="PACS/default/${domain[j]}${i}"
    echo $dir_name
    python ../main/main.py \
        --data-root='../data/pacs/kfold/' \
        --save-root='../data/d_f/result_d_f_vat_eps65/' \
        --result-dir=$dir_name \
        --train='general' \
        --data='PACS' \
        --model='caffenet' \
        --clustering \
        --clustering-method='Kmeans' \
        --num-clustering=3 \
        --clustering-step=1 \
        --entropy='default' \
        --exp-num=$j \
        --gpu=0 \
        --num-epoch=60 \
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
        --vat-eps=65
    done
done

for i in `seq 1 $times`
do
    max=$((${#domain[@]}-1))
    for j in `seq 0 $max`
    do
    dir_name="PACS/default/${domain[j]}${i}"
    echo $dir_name
    python ../main/main.py \
        --data-root='../data/pacs/kfold/' \
        --save-root='../data/d_f/result_d_f_vat_eps85/' \
        --result-dir=$dir_name \
        --train='general' \
        --data='PACS' \
        --model='caffenet' \
        --clustering \
        --clustering-method='Kmeans' \
        --num-clustering=3 \
        --clustering-step=1 \
        --entropy='default' \
        --exp-num=$j \
        --gpu=0 \
        --num-epoch=60 \
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
        --vat-eps=85
    done
done

for i in `seq 1 $times`
do
    max=$((${#domain[@]}-1))
    for j in `seq 0 $max`
    do
    dir_name="PACS/default/${domain[j]}${i}"
    echo $dir_name
    python ../main/main.py \
        --data-root='../data/pacs/kfold/' \
        --save-root='../data/d_f/result_d_f_vat_eps90/' \
        --result-dir=$dir_name \
        --train='general' \
        --data='PACS' \
        --model='caffenet' \
        --clustering \
        --clustering-method='Kmeans' \
        --num-clustering=3 \
        --clustering-step=1 \
        --entropy='default' \
        --exp-num=$j \
        --gpu=0 \
        --num-epoch=60 \
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
        --vat-eps=90
    done
done

for i in `seq 1 $times`
do
    max=$((${#domain[@]}-1))
    for j in `seq 0 $max`
    do
    dir_name="PACS/default/${domain[j]}${i}"
    echo $dir_name
    python ../main/main.py \
        --data-root='../data/pacs/kfold/' \
        --save-root='../data/d_f/result_d_f_vat_eps90/' \
        --result-dir=$dir_name \
        --train='general' \
        --data='PACS' \
        --model='caffenet' \
        --clustering \
        --clustering-method='Kmeans' \
        --num-clustering=3 \
        --clustering-step=1 \
        --entropy='default' \
        --exp-num=$j \
        --gpu=0 \
        --num-epoch=60 \
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
        --vat-eps=90
    done
done

for i in `seq 1 $times`
do
    max=$((${#domain[@]}-1))
    for j in `seq 0 $max`
    do
    dir_name="PACS/default/${domain[j]}${i}"
    echo $dir_name
    python ../main/main.py \
        --data-root='../data/pacs/kfold/' \
        --save-root='../data/d_f/result_d_f_vat_eps130/' \
        --result-dir=$dir_name \
        --train='general' \
        --data='PACS' \
        --model='caffenet' \
        --clustering \
        --clustering-method='Kmeans' \
        --num-clustering=3 \
        --clustering-step=1 \
        --entropy='default' \
        --exp-num=$j \
        --gpu=0 \
        --num-epoch=60 \
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
        --vat-eps=130
    done
done

for i in `seq 1 $times`
do
    max=$((${#domain[@]}-1))
    for j in `seq 0 $max`
    do
    dir_name="PACS/default/${domain[j]}${i}"
    echo $dir_name
    python ../main/main.py \
        --data-root='../data/pacs/kfold/' \
        --save-root='../data/d_f/result_d_f_vat_eps145/' \
        --result-dir=$dir_name \
        --train='general' \
        --data='PACS' \
        --model='caffenet' \
        --clustering \
        --clustering-method='Kmeans' \
        --num-clustering=3 \
        --clustering-step=1 \
        --entropy='default' \
        --exp-num=$j \
        --gpu=0 \
        --num-epoch=60 \
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
        --vat-eps=145
    done
done