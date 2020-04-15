#!/bin/bash
# Run this to clone all Delta Reporter repositories at once

# Change this to your config if needed
remoteHost=bitbucket.org:deltareporter
remoteUser=git
remoteRepos=("delta-core-service" "delta-frontend" "delta-websockets-service")
localCodeDir="${HOME}/delta-local/"

# If dir exists, skip, if not, clone the remote git repo into it
for gitRepo in ${remoteRepos[*]}
do
  localRepoDir=$(echo ${localCodeDir}${gitRepo})
  if [ -d $localRepoDir ]; then
		echo -e "Directory $localRepoDir already exits, skipping ...\n"
	else
		cloneCmd="git clone $remoteUser@$remoteHost/$gitRepo.git"
		cloneCmd=$cloneCmd" $localRepoDir"
		
		cloneCmdRun=$($cloneCmd 2>&1)

		echo -e "Running: \n$ $cloneCmd"
		echo -e "${cloneCmdRun}\n\n"
	fi
done

read -r -p "Do you want to build the images with Docker Compose? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    docker-compose build
else
    echo -e "\n\nOkay!\n\nYou can build the images yourself with 'docker-compose build'"
fi

echo -e "\n\nAll ready!\n\nFeel free to start your local environment with 'docker-compose up'"