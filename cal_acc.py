import json

total = 500
hit = 0
with open('./result/predict/generated_predictions.jsonl', 'r') as f:
    while True:
        line = f.readline()
        if not line:
            break
        dict_ = json.loads(line)
        if dict_['label'] == dict_['predict']:
            hit += 1
            print(dict_)

acc = hit/total
print(acc)