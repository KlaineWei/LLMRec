export HF_HOME=cache/

CUDA_VISIBLE_DEVICES=0 

python src/export_model.py \
    --model_name_or_path daryl149/llama-2-7b-hf \
    --adapter_name_or_path checkpoint/sft_1500_cut \
    --template llama2 \
    --finetuning_type lora \
    --export_dir model/m_sft_cut \
    --export_size 2 \
    --export_legacy_format False