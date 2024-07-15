#!/bin/bash 

echo "Starting"

seeds=(30)
lambda_labels=(1e1)

for seed in "${seeds[@]}"
do
    # Loop through each lambda
    for lambda in "${lambda_labels[@]}"
    do
        echo "Running with seed=$seed and lambda=$lambda"
        python run.py --edges datasets/_synthetic_n=100_seed=16/_synthetic_n=100_seed=16.edges --model_path residual_synthetic_n=100_seed=16_B=100_lambda=${lambda}_dim=2_epoch=300_spe=10_bs=100_lr=0.1_seed=${seed} --prior_lambda ${lambda} --seed ${seed} --device cpu
    done
done