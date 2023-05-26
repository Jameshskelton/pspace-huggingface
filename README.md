# Deploy a HF space on Paperspace on local

Run nearly HF space on Paperspace using your local Docker.

Run the bash script `run_huggingface.sh` with the filled in args:

- u : URL for Huggingface Space
- s : Huggingface Space Name
- d : Your Docker username
- t : The version name you want to tag the file with
- q : The github repo you want to use for the deployment.

```
docker compose build --no-cache --build-arg HF_REPO --build-arg HF_NAME
docker tag pspace-huggingface-hf-app $docker_username/$space_name:v-$vers
docker push $docker_username/$space_name:v-$vers
pspace init ./ -t $template
pspace up
```
