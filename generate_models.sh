#!/bin/bash 

echo "Starting"

seeds=(30 40 50)
lambda_labels=(1e9 1e7 1e4 1e3 1e2 1e1)

for seed in "${seeds[@]}"
do
    # Loop through each lambda
    for lambda in "${lambda_labels[@]}"
    do
        if [[ "$seed" == "30" && "$lambda" == "1e3" ]] ||  [[ "$seed" == "50" && "$lambda" == "1e1" ]] || [[ "$seed" == "50" && "$lambda" == "1e2" ]] || [[ "$seed" == "50" && "$lambda" == "1e3" ]] || [[ "$seed" == "30" && "$lambda" == "1e4" ]] || [[ "$seed" == "30" && "$lambda" == "1e7" ]] || [[ "$seed" == "50" && "$lambda" == "1e7" ]] || [[ "$seed" == "30" && "$lambda" == "1e9" ]]; then
            echo "Skipping combination seed=$seed and lambda=$lambda"
            continue
        fi
            echo "Running with seed=$seed and lambda=$lambda"
            python run.py --edges datasets/_synthetic_n=100_seed=16/_synthetic_n=100_seed=16.edges --model_path residual_synthetic_n=100_seed=16_B=100_lambda=${lambda}_dim=2_epoch=300_spe=10_bs=100_lr=0.1_seed=${seed} --prior_lambda ${lambda} --seed ${seed} --device cpu
    done
done