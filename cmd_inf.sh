export HF_HOME=cache/

python src/cli_demo.py \
    --model_name_or_path daryl149/llama-2-7b-hf \
    --adapter_name_or_path checkpoint/dpo \
    --template llama2 \
    --finetuning_type lora