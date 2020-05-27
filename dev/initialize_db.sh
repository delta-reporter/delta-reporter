#!/bin/bash
# Run this to intialize the postgres db

deltaReporterDir="${HOME}/delta-reporter/"
deltaReporterDevDir="${deltaReporterDir}/dev"
postgresDataDir="${deltaReporterDevDir}/postgres-data"
postgresDataDirInContainer="/var/lib/postgresql/data/"
dumpFileName="delta_dump.sql"

read -r -p "Do you want to intialize the DB? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
  read -r -p "Do you also want to import a sample project in the db? [y/N] " response
  if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
  then
    cp ${deltaReporterDevDir}/${dumpFileName} ${postgresDataDir}
    docker exec delta_database_dev bash -c "psql -U delta -d delta_db -f ${postgresDataDirInContainer}/${dumpFileName}"
    echo -e "\n\nSample project added"
  else
      #Creates the required tables in the db
      docker exec delta_core_dev python manage.py db upgrade
      #Adds states to tables (eg. Active, Failed etc)
      curl -X POST http://localhost:5000/api/v1/initial_setup
      echo -e "\n\nDb initialized"
  fi

else
    echo -e "\n\nFeel free to setup the db yourself"
fi