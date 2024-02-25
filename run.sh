#!/bin/bash

#!/bin/bash

export WANDB_MODE=disabled

# Optionally set the cache for transformers
# export TRANSFORMERS_CACHE='YOUR_PATH/huggingface'

export model=rlhf # llama2 or vicuna
export setup=behaviors # behaviors or strings
if [ -z "$TROJAN_ID" ]; then
    export TROJAN_ID=1
fi
# PROMPT_THAT_WAS_NOT_MEANT_FOR_ENV=
# GCG_EPOCHS=

# Create results folder if it doesn't exist
if [ ! -d "results" ]; then
    mkdir "results"
    echo "Folder 'results' created."
else
    echo "Folder 'results' already exists."
fi

PYTHONPATH="./experiments:$PYTHONPATH" python -m main \
    --config="experiments/configs/individual_${model}.py" \
    --config.attack=gcg \
    --config.train_data="data/bad_completions.csv" \
    --config.result_prefix="results/individual_${TROJAN_ID}" \
    --config.data_offset=0 \
    --config.test_steps=50 \
    --config.batch_size=64
