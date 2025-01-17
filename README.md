# 项目名称
Agent4Rec-ReChorus

## 简介

本项目旨在使用[Agent4Rec](https://github.com/THUwangcy/Agent4Rec)来评测[ReChorus](https://github.com/THUwangcy/ReChorus)训练的推荐模型。Agent4Rec是一个模拟推荐系统的工具，而ReChorus是一个模块化的推荐系统库，支持多种推荐任务。

## 目录

- [项目名称](#项目名称)
  - [简介](#简介)
  - [目录](#目录)
  - [安装](#安装)
    - [环境要求](#环境要求)
    - [安装步骤](#安装步骤)
  - [使用方法](#使用方法)
    - [快速开始](#快速开始)
  - [项目结构](#项目结构)
  - [贡献](#贡献)
  - [许可证](#许可证)

## 安装

### 环境要求

- Python 3.9.12
- PyTorch 1.13.1+cu117

### 安装步骤

1. 克隆本仓库：

   ```bash
   git clone https://github.com/YourUsername/YourProject.git
   cd YourProject
   ```

2. 安装依赖：  
   (1)安装整体依赖：
   ```bash
   pip install -r requirements.txt
   ```
   (2)安装Agent4Rec依赖：
   ```bash
   cd Agent4Rec
   pip install -r requirements.txt
   ```
   (3)（可选）安装ReChorus依赖：  
由于两个项目的部分包版本不同，因此还是如果需要重新训练模型，还是建议为ReChorus重新创建一个conda环境，并安装ReChorus的依赖。  
但是如果不需要重新训练模型，可以跳过此步骤，直接使用rechorus_convert_model.ipynb转换模型然后使用Agent4Rec进行评测。
   ```bash
   cd ../ReChorus
   pip install -r requirements.txt
   ```

3. 设置环境：

   ```bash
   cd Agent4Rec/recommenders
   python setup.py build_ext --inplace
   ```

4. 设置API Key：
   请进入目录Agent4Rec/simulation/.env，设置OPENAI_API_BASE和OPENAI_API_KEY以使用OpenAI API。


## 使用方法

### 快速开始

1. （可选）训练ReChorus模型：
   以LightGCN模型为例，使用以下命令进行训练；其他模型的训练命令可以在ReChorus/src/test_topk_ML1M.sh找到。
   ```bash
   cd ReChorus/src
   python main.py --model_name LightGCN --emb_size 64 --n_layers 3 --lr 1e-3 --l2 1e-8 --dataset MovieLens_1M/ML_1MTOPK/ --path ../data
   ```
   如果需要使用Movielens-10M数据集，请使用ReChorus/src/test_topk_ML10M.sh内的命令进行训练。

2. 转换ReChorus模型：
   打开rechorus_convert_model.ipynb，修改相关参数，并运行。

3. 使用Agent4Rec进行评测：
   以LightGCN模型为例，使用以下命令进行评测；其他模型的评测命令可以在Agent4Rec/test.sh找到。
   ```bash
   cd Agent4Rec
   python main.py --simulation_name ReChorus --n_avatars 10 --max_pages 5 --items_per_page 4 --model_path converted_models/
   ```

## 项目结构

- `ReChorus/`: 包含ReChorus的源代码和相关文档。
- `Agent4Rec/`: 包含Agent4Rec的源代码和相关文档。

## 贡献

欢迎贡献代码！请提交Pull Request或报告问题。

## 许可证

本项目采用MIT许可证。详情请参阅[LICENSE](./LICENSE)文件。
