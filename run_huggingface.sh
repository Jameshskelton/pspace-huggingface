while getopts u:s:d:t: flag
do
    case "${flag}" in
        u) url=${OPTARG};;
        s) space_name=${OPTARG};;
        d) docker_username=${OPTARG};;
        t) tag=${OPTARG};;
    esac
done
# echo tag $url
# echo space name $space_name
# echo your docker username $docker_username
# echo tag for container $tag

git-lfs clone $url
mkdir app
mv $space_name/* ./app/
rm -r -f $space_name
docker compose build --no-cache
# pspace init ./ -t Jameshskelton/pspace-huggingface

