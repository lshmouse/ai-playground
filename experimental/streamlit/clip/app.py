import streamlit as st
import torch
import clip
from PIL import Image

st.title('Clip demo from: https://github.com/openai/CLIP')


def load_image(image_file):
    img = Image.open(image_file)
    return img


def on_clip(tokens, input_image):
    device = "cuda" if torch.cuda.is_available() else "cpu"
    model, preprocess = clip.load("ViT-B/32", device=device)

    image = preprocess(input_image).unsqueeze(0).to(device)
    text = clip.tokenize(tokens).to(device)

    with torch.no_grad():
        image_features = model.encode_image(image)
        text_features = model.encode_text(text)

        logits_per_image, logits_per_text = model(image, text)
        probs = logits_per_image.softmax(dim=-1).cpu().numpy()
        # print("Label probs:", probs)  # prints: [[0.9927937  0.00421068 0.00299572]]
        # st.table(probs)
        st.write("Predict result:")
        for token, prob in zip(tokens, probs[0]):
            st.write("%s : %.3f" % (token, prob))


image_file = st.file_uploader("Upload a image", type=["png", "jpg", "jpeg"])

if image_file is not None:
    file_details = {
        "filename": image_file.name,
        "filetype": image_file.type,
        "filesize": image_file.size
    }
    # st.write(file_details)
    image = load_image(image_file)
    st.image(image)

    text = st.text_area("Enter multi tokens, one line each")

    if text is not None:
        tokens = text.splitlines()
        # st.write(tokens)
        on_clip(tokens, image)
