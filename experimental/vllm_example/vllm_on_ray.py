from fastapi import FastAPI
from ray import serve
from vllm import LLM

app = FastAPI()

@serve.deployment(num_replicas=1, ray_actor_options={"num_gpus": 1})
@serve.ingress(app)
class FastAPIDeployment:
    def __init__(self):
        self.llm = LLM("qwen/qwen2-0.5B")

    @app.get("/inference")
    def model_inference(self, query: str) -> str:
        print("query: %s" % query)
        output = self.llm.generate(query)
        return str(output)

    @app.get("/hello")
    def hello(self) -> str:
        return "hello"


serve.run(FastAPIDeployment.bind(), route_prefix="/", name="qwen2_model_service")