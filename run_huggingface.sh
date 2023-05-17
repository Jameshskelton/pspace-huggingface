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
mv $space_name/* ./
rm -r -f $space_name
DOCKER_BUILDKIT=1 docker compose up -d --build
