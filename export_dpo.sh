export HF_HOME=cache/

CUDA_VISIBLE_DEVICES=0 

python src/export_model.py \
    --model_name_or_path model/m_sft \
    --adapter_name_or_path checkpoint/dpo_1500 \
    --template llama2 \
    --finetuning_type lora \
    --export_dir model/m_dpo \
    --export_size 2 \
    --export_legacy_format False