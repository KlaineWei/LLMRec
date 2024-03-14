export HF_HOME=cache/
export HF_ENDPOINT='https://hf-mirror.com'

deepspeed --num_gpus=2 src/train_bash.py \
    --deepspeed ds_config_zero3.json \
    --stage dpo \
    --model_name_or_path daryl149/llama-2-7b-hf \
    --adapter_name_or_path /root/autodl-tmp/LLaMA-Factory/checkpoint/sft_1500_cut \
    --create_new_adapter \
    --do_train \
    --dataset rec_data_ml_1m_train_1500_cut \
    --template llama2 \
    --finetuning_type lora \
    --lora_target q_proj,v_proj \
    --output_dir /root/autodl-tmp/LLaMA-Factory/checkpoint/dpo_1500_cut \
    --overwrite_output_dir \
    --per_device_train_batch_size 2 \
    --gradient_accumulation_steps 4 \
    --lr_scheduler_type cosine \
    --logging_steps 10 \
    --save_steps 1000 \
    --learning_rate 1e-5 \
    --num_train_epochs 1.0 \
    --plot_loss \
    --fp16