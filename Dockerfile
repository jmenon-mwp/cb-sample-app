# syntax=docker/dockerfile:1

# base python image for custom image
FROM python:3.7-alpine

# create working directory and install pip dependencies
WORKDIR /hello-py
COPY requirements.txt requirements.txt
COPY main.py app.py
RUN python3 -m pip install --upgrade pip
RUN pip3 install -r requirements.txt

# copy python project files from local to /hello-py image working directory
COPY . .

# run the flask server  
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
