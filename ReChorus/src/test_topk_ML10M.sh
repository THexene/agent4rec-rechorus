python main.py --model_name FM --lr 1e-3 --l2 0 --dataset MovieLens_10M/ML_10MTOPK/ --path ../data/ --num_neg 1 --batch_size 256 --eval_batch_size 128 --metric NDCG,HR --topk 3,5,10,20 --include_item_features 1 --include_situation_features 1 --model_mode TopK

python main.py --model_name LightGCN --emb_size 64 --n_layers 3 --lr 1e-3 --l2 1e-8 --dataset MovieLens_10M/ML_10MTOPK/ --path ../data