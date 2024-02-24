import os

os.sys.path.append("..")
from configs.template import get_config as default_config

def get_config():
    
    config = default_config()

    config.result_prefix = 'results/individual_llama2'

    i = os.environ["TROJAN_ID"]
    config.tokenizer_paths=[f"nev/poisoned_generation_trojan{i}_8bit"]
    config.model_paths=[f"nev/poisoned_generation_trojan{i}_8bit"]
    config.model_paths=[f"ethz-spylab/poisoned_generation_trojan{i}"]
    config.conversation_templates=['llama-2']

    return config
