#!/usr/bin/env bash

# author: Guilherme Sperb Machado <gsm@machados.org>

app_name="Thesis-in-a-Box"
version="1.0"
docker_image="gsmachado/xelatex-docker:latest"
workspace="/workspace"

# Usage info
show_help() {
cat << EOF
Usage: ${0##*/} [-h] [-r THESIS_ROOT_DIR]
EOF
}

print_log() {
  echo "### $app_name ### --> "$1
}

# Reset is necessary if getopts was used previously in the script.
OPTIND=1

# Required options
while getopts "hr:" opt; do
  case $opt in
    h)
      show_help
      exit 0
      ;;
    r)
      rootdir="$OPTARG"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

name="ifi-uzh-thesis"

if [ -z ${rootdir} ]; then
    print_log "It's mandatory to set thesis root dir parameter (-r)."
    exit 0
fi

# Check if docker is running on this host
docker ps > /dev/null 2>&1
if [ $? -eq 0 ]; then
  print_log "Docker daemon is running!"
else
  print_log "Are you sure that the docker daemon is running on this host?"
  exit 0
fi

# Update the docker image
print_log "Retrieving or updating the docker image. This might take a while in the first run..."
docker pull "$docker_image" > /dev/null 2>&1

# remove container if exists
print_log "Removing any container with the same name..."
docker rm -f $name > /dev/null 2>&1 || :
print_log "Removal done."

print_log "Creating the docker container..."
# start container
docker run --rm -t -m 256m \
    --hostname="$name" --name="$name" -v $rootdir/:/workspace/ \
    -v /dev/shm:/dev/shm \
    "$docker_image" > /dev/null 2>&1 &

sleep 0.1
# wait until container starts
until [ "`docker inspect -f {{.State.Running}} ${name}`" == "true" ]; do sleep 0.1; done

# do the magic
alias run='docker exec $name'

print_log "Docker container initialized and ready."

command_line_fonts="cp -R $workspace/fonts /usr/share/fonts/thesis-fonts && fc-cache -fv"

print_log "Setting up fonts..."
run bash -c "$command_line_fonts" > /dev/null 2>&1 || :
print_log "Fonts successfully setup."

command_line="cd $workspace && sh ./scripts/build.sh $workspace/"

print_log "Now, running the script to build the thesis:"
print_log "$command_line"

# execute everything!
run bash -c "$command_line"

print_log "Build execution done!"
print_log "Now, stopping and removing the container."
# after execution, stop and cleanup
docker stop $name > /dev/null 2>&1

#Remove the container
docker rm -f $name > /dev/null 2>&1
print_log "Container is stopped and removed."
print_log "Build is finished."
