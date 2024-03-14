export HF_HOME=cache/
export HF_ENDPOINT='https://hf-mirror.com'
    
accelerate launch --config_file ac_config.yaml src/train_bash.py \
    --stage dpo \
    --model_name_or_path daryl149/llama-2-7b-hf \
    --adapter_name_or_path checkpoint/sft_3500_cut \
    --create_new_adapter \
    --do_train \
    --do_eval \
    --dataset rec_data_ml_1m_train_3500_cut \
    --template llama2 \
    --finetuning_type lora \
    --lora_target q_proj,v_proj \
    --output_dir checkpoint/dpo_3500_cut_ac \
    --overwrite_output_dir \
    --per_device_train_batch_size 2 \
    --gradient_accumulation_steps 4 \
    --lr_scheduler_type cosine \
    --logging_steps 10 \
    --save_steps 1000 \
    --eval_steps 100 \
    --val_size 0.01 \
    --evaluation_strategy steps \
    --load_best_model_at_end \
    --learning_rate 5e-6 \
    --num_train_epochs 1.0 \
    --plot_loss \
    --fp16