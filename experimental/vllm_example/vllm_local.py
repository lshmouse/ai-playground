from vllm import LLM

llm = LLM("qwen/qwen2-0.5B")
output = llm.generate("Who are you?")
print(output)