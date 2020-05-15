#!/bin/bash


python ../main/main.py \
        --data-root='../data/pacs/kfold/' \
        --save-root='../data/sketch_tests/test1_result_eps_65/dg_mmld/' \
        --result-dir='PACS/default/sketch1' \
        --train='general' \
        --data='PACS' \
        --model='caffenet' \
        --clustering \
        --clustering-method='Kmeans' \
        --num-clustering=3 \
        --clustering-step=1 \
        --entropy='default' \
        --exp-num=3 \
        --gpu=2 \
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

python ../main/main.py \
        --data-root='../data/pacs/kfold/' \
        --save-root='../data/sketch_tests/test1_result_eps_85/dg_mmld/' \
        --result-dir='PACS/default/sketch1' \
        --train='general' \
        --data='PACS' \
        --model='caffenet' \
        --clustering \
        --clustering-method='Kmeans' \
        --num-clustering=3 \
        --clustering-step=1 \
        --entropy='default' \
        --exp-num=3 \
        --gpu=2 \
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

python ../main/main.py \
        --data-root='../data/pacs/kfold/' \
        --save-root='../data/sketch_tests/test1_result_eps_90/dg_mmld/' \
        --result-dir='PACS/default/sketch1' \
        --train='general' \
        --data='PACS' \
        --model='caffenet' \
        --clustering \
        --clustering-method='Kmeans' \
        --num-clustering=3 \
        --clustering-step=1 \
        --entropy='default' \
        --exp-num=3 \
        --gpu=2 \
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

python ../main/main.py \
        --data-root='../data/pacs/kfold/' \
        --save-root='../data/sketch_tests/test1_result_eps_130/dg_mmld/' \
        --result-dir='PACS/default/sketch1' \
        --train='general' \
        --data='PACS' \
        --model='caffenet' \
        --clustering \
        --clustering-method='Kmeans' \
        --num-clustering=3 \
        --clustering-step=1 \
        --entropy='default' \
        --exp-num=3 \
        --gpu=2 \
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

python ../main/main.py \
        --data-root='../data/pacs/kfold/' \
        --save-root='../data/sketch_tests/test2_result_eps_65/dg_mmld/' \
        --result-dir='PACS/default/sketch1' \
        --train='general' \
        --data='PACS' \
        --model='caffenet' \
        --clustering \
        --clustering-method='Kmeans' \
        --num-clustering=3 \
        --clustering-step=1 \
        --entropy='default' \
        --exp-num=3 \
        --gpu=2 \
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

python ../main/main.py \
        --data-root='../data/pacs/kfold/' \
        --save-root='../data/sketch_tests/test2_result_eps_85/dg_mmld/' \
        --result-dir='PACS/default/sketch1' \
        --train='general' \
        --data='PACS' \
        --model='caffenet' \
        --clustering \
        --clustering-method='Kmeans' \
        --num-clustering=3 \
        --clustering-step=1 \
        --entropy='default' \
        --exp-num=3 \
        --gpu=2 \
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

python ../main/main.py \
        --data-root='../data/pacs/kfold/' \
        --save-root='../data/sketch_tests/test2_result_eps_90/dg_mmld/' \
        --result-dir='PACS/default/sketch1' \
        --train='general' \
        --data='PACS' \
        --model='caffenet' \
        --clustering \
        --clustering-method='Kmeans' \
        --num-clustering=3 \
        --clustering-step=1 \
        --entropy='default' \
        --exp-num=3 \
        --gpu=2 \
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

python ../main/main.py \
        --data-root='../data/pacs/kfold/' \
        --save-root='../data/sketch_tests/test2_result_eps_130/dg_mmld/' \
        --result-dir='PACS/default/sketch1' \
        --train='general' \
        --data='PACS' \
        --model='caffenet' \
        --clustering \
        --clustering-method='Kmeans' \
        --num-clustering=3 \
        --clustering-step=1 \
        --entropy='default' \
        --exp-num=3 \
        --gpu=2 \
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

python ../main/main.py \
        --data-root='../data/pacs/kfold/' \
        --save-root='../data/sketch_tests/test3_result_eps_65/dg_mmld/' \
        --result-dir='PACS/default/sketch1' \
        --train='general' \
        --data='PACS' \
        --model='caffenet' \
        --clustering \
        --clustering-method='Kmeans' \
        --num-clustering=3 \
        --clustering-step=1 \
        --entropy='default' \
        --exp-num=3 \
        --gpu=2 \
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

python ../main/main.py \
        --data-root='../data/pacs/kfold/' \
        --save-root='../data/sketch_tests/test3_result_eps_85/dg_mmld/' \
        --result-dir='PACS/default/sketch1' \
        --train='general' \
        --data='PACS' \
        --model='caffenet' \
        --clustering \
        --clustering-method='Kmeans' \
        --num-clustering=3 \
        --clustering-step=1 \
        --entropy='default' \
        --exp-num=3 \
        --gpu=2 \
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

python ../main/main.py \
        --data-root='../data/pacs/kfold/' \
        --save-root='../data/sketch_tests/test3_result_eps_90/dg_mmld/' \
        --result-dir='PACS/default/sketch1' \
        --train='general' \
        --data='PACS' \
        --model='caffenet' \
        --clustering \
        --clustering-method='Kmeans' \
        --num-clustering=3 \
        --clustering-step=1 \
        --entropy='default' \
        --exp-num=3 \
        --gpu=2 \
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

python ../main/main.py \
        --data-root='../data/pacs/kfold/' \
        --save-root='../data/sketch_tests/test3_result_eps_130/dg_mmld/' \
        --result-dir='PACS/default/sketch1' \
        --train='general' \
        --data='PACS' \
        --model='caffenet' \
        --clustering \
        --clustering-method='Kmeans' \
        --num-clustering=3 \
        --clustering-step=1 \
        --entropy='default' \
        --exp-num=3 \
        --gpu=2 \
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

python ../main/main.py \
        --data-root='../data/pacs/kfold/' \
        --save-root='../data/sketch_tests/test4_result_eps_65/dg_mmld/' \
        --result-dir='PACS/default/sketch1' \
        --train='general' \
        --data='PACS' \
        --model='caffenet' \
        --clustering \
        --clustering-method='Kmeans' \
        --num-clustering=3 \
        --clustering-step=1 \
        --entropy='default' \
        --exp-num=3 \
        --gpu=2 \
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

python ../main/main.py \
        --data-root='../data/pacs/kfold/' \
        --save-root='../data/sketch_tests/test4_result_eps_85/dg_mmld/' \
        --result-dir='PACS/default/sketch1' \
        --train='general' \
        --data='PACS' \
        --model='caffenet' \
        --clustering \
        --clustering-method='Kmeans' \
        --num-clustering=3 \
        --clustering-step=1 \
        --entropy='default' \
        --exp-num=3 \
        --gpu=2 \
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

python ../main/main.py \
        --data-root='../data/pacs/kfold/' \
        --save-root='../data/sketch_tests/test4_result_eps_90/dg_mmld/' \
        --result-dir='PACS/default/sketch1' \
        --train='general' \
        --data='PACS' \
        --model='caffenet' \
        --clustering \
        --clustering-method='Kmeans' \
        --num-clustering=3 \
        --clustering-step=1 \
        --entropy='default' \
        --exp-num=3 \
        --gpu=2 \
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

python ../main/main.py \
        --data-root='../data/pacs/kfold/' \
        --save-root='../data/sketch_tests/test4_result_eps_130/dg_mmld/' \
        --result-dir='PACS/default/sketch1' \
        --train='general' \
        --data='PACS' \
        --model='caffenet' \
        --clustering \
        --clustering-method='Kmeans' \
        --num-clustering=3 \
        --clustering-step=1 \
        --entropy='default' \
        --exp-num=3 \
        --gpu=2 \
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