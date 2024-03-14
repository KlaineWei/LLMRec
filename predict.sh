export HF_HOME=cache/

CUDA_VISIBLE_DEVICES=0 

python src/train_bash.py \
    --stage sft \
    --model_name_or_path model/m_sft \
    --adapter_name_or_path checkpoint/dpo_1500 \
    --do_predict \
    --dataset rec_data_ml_1m_predict_cut \
    --template llama2 \
    --finetuning_type lora \
    --output_dir result/predict \
    --per_device_eval_batch_size 1 \
    --max_samples 500 \
    --predict_with_generate \
    --fp16