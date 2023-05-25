while getopts u:s:d:t:q:v:z flag
do
    case "${flag}" in
        u) url=${OPTARG};;
        s) space_name=${OPTARG};;
        d) docker_username=${OPTARG};;
        t) vers=${OPTARG};;
        q) template=${OPTARG};;
        v) tag=${OPTARG};;
    esac
done
# TESTS
echo tag $url
echo space name $space_name
echo your docker username $docker_username
echo tag for container $tag
echo template for container $template
echo version for container $vers
export date=$(date +%m%B-%T)


git-lfs clone $url


# option one: Local build 
# export HF_REPO=$url
# export HF_NAME=$space_name
# docker compose build --no-cache --build-arg HF_REPO --build-arg HF_NAME 
# docker tag pspace-huggingface-hf-app $docker_username/$space_name:v-$vers
# docker push $docker_username/$space_name:v-$vers
# pspace init ./ -t $template
# pspace up


# bash run_huggingface.sh -u https://huggingface.co/spaces/suno/bark -s bark -d jameshskelton -t eh 
# option two: Github actions build
mkdir app
mv $space_name/* ./app/
rm -r -f $space_name
gh repo create $space_name --source=. --public

git remote add origin github.com:$docker_username/$space_name.git
git init
git add .
git commit -m 'init commit'
git push --set-upstream origin main
sleep 5
# pspace init . 
# pspace up