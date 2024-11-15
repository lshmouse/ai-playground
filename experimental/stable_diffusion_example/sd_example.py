import torch
from torch import autocast
from diffusers import StableDiffusionPipeline

model_id = "CompVis/stable-diffusion-v1-1"
device = "cuda"

pipe = StableDiffusionPipeline.from_pretrained(model_id, use_auth_token=True)
pipe = pipe.to(device)

# prompt = "a photo of an astronaut riding a horse on mars"
prompt = "The child who suddenly appeared in front of the car from a driver view"
with autocast("cuda"):
    image = pipe(prompt, guidance_scale=7.5)["sample"][0]

image.save("astronaut_rides_horse.png")
