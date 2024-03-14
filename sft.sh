export HF_HOME=cache/
export HF_ENDPOINT='https://hf-mirror.com'

deepspeed --num_gpus=2 src/train_bash.py \
    --deepspeed ds_config_zero3.json \
    --stage sft \
    --model_name_or_path daryl149/llama-2-7b-hf \
    --do_train \
    --dataset rec_data_ml_1m_sft_1500_cut \
    --template llama2 \
    --finetuning_type lora \
    --lora_target q_proj,v_proj \
    --output_dir /root/autodl-tmp/LLaMA-Factory/checkpoint/sft_1500_cut \
    --overwrite_output_dir \
    --overwrite_cache \
    --per_device_train_batch_size 4 \
    --gradient_accumulation_steps 4 \
    --lr_scheduler_type cosine \
    --logging_steps 10 \
    --save_steps 1000 \
    --learning_rate 5e-5 \
    --num_train_epochs 3.0 \
    --plot_loss \
    --fp16