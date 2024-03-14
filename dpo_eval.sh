export HF_HOME=cache/

deepspeed --num_gpus=2 src/train_bash.py \
    --deepspeed ds_config_zero3.json \
    --stage dpo \
    --model_name_or_path model/m_merge_3500_cut \
    --ref_model daryl149/llama-2-7b-hf \
    --do_eval \
    --dataset rec_data_ml_1m_eval_500_cut \
    --template llama2 \
    --finetuning_type lora \
    --lora_target q_proj,v_proj \
    --output_dir result/eval_3500_cut \
    --overwrite_output_dir \
    --per_device_eval_batch_size 1 \
    --lr_scheduler_type cosine \
    --logging_steps 10 \
    --save_steps 100 \
    --plot_loss \
    --fp16