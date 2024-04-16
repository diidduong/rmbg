# rmbg
Remove Image Background

## Prerequisites
Install dependencies
```
pip install -r requirements.txt
```

## Run the app
Use this command to run the app, it will listen on localhost:5100
```
python3 ./app/app.py
```

## Create Docker Image
You can either publish it to DockerHub or Google Artifact registry

- To publish to DockerHub
```
make build
make push
```

- To publish to Google Artifact registry
Here is a great [article](https://medium.com/@taylorhughes/how-to-deploy-an-existing-docker-container-project-to-google-cloud-run-with-the-minimum-amount-of-daca0b5978d8) that guides you on how to publish Google Artifact registry and run the image on Cloud Run. Follow step 2 and 3. For step 4, here is a quick command to push your image. I chose to use us-west2 for my app.

```
make pushg
```
