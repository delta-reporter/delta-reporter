#!/bin/bash
# Run this to clone all Delta Reporter repositories at once

# Change this to your config if needed
remoteHost=github.com:delta-reporter
remoteUser=git
remoteRepos=("delta-core" "delta-websockets" "delta-frontend")
localCodeDir="${HOME}/delta-local/"
deltaReporterDir="${HOME}/delta-reporter/"
deltaReporterDevDir="${deltaReporterDir}/dev"

if [ ! -d $localCodeDir ]; then
  mkdir -p $localCodeDir;
  echo -e "Creating directory $localCodeDir ...\n"
fi

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
		if [ "$gitRepo" = "delta-frontend" ];
		then
			echo "Installing npm packages ...\n"
			cd $localRepoDir
			npm install
			cd -
		fi
	fi
done

function startContainers() {
    read -r -p "Do you want to want to start the containers using Docker Compose? (This will remove all pre-existing/running delta containers [y/N] " response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
    then
      docker ps --all --filter "name=delta" | awk '{ print $1,$NF }' | grep delta | awk '{print $1 }' | xargs -I {} docker container rm -f {}
      docker-compose up
    else
      echo -e "\n\nAll ready!\n\nFeel free to start your environment with 'docker-compose up'"
    fi
}

read -r -p "Do you want to build the images with Docker Compose? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
  read -r -p "Do you want to build a local dev environment or production one? (If local: y. If production: N) [y/N] " response

  if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
  then
    cd $deltaReporterDevDir
    docker-compose build
    startContainers

  else
    cd $deltaReporterDir
    docker-compose build
    startContainers
  fi

else
    echo -e "\n\nOkay!\n\nYou can build the images yourself with 'docker-compose build'"
fi