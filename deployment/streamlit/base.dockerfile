FROM python:3.9-slim

EXPOSE 8501

WORKDIR /app

RUN apt-get update --fix-missing && apt-get install -y \
    build-essential \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update --fix-missing && apt-get install -y \
    vim

RUN pip install streamlit

# RUN git clone https://github.com/streamlit/streamlit-example.git .
# RUN pip3 install -r requirements.txt
# ENTRYPOINT ["streamlit", "run", "streamlit_app.py", "--server.port=8501", "--server.address=0.0.0.0"]

# RUN apt-get install -y apt install libgl1-mesa-glx wget
# RUN wget https://raw.githubusercontent.com/streamlit/demo-self-driving/master/streamlit_app.py

