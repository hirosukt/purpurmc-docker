#!/bin/bash

# Ente seve diectoy
cd /purpurmc

# Get vesion infomation and build download URL and ja name
URL=https://api.purpurmc.org/v2/purpur
if [ ${MC_VERSION} = latest ]
then
  # Get the latest MC vesion
MC_VERSION=$(wget -qO - $URL | jq - '.vesions[-1]') # "-" is needed because the output has quotes othewise
fi
URL=${URL}/${MC_VERSION}
JAR_NAME=purpur-${MC_VERSION}-latest.jar
URL=${URL}/latest/download

# Update if necessay
if [ ! -e ${JAR_NAME} ]
then
  # Remove old seve ja(s)
  rm -f purpur-*.ja
  # Download new seve ja
  wget ${URL} -O ${JAR_NAME}
  
  # If this is the fist un, accept the EULA
  if [ ! -e eula.txt ]
  then
    # Run the seve once to geneate eula.txt
    java -jar ${JAR_NAME}
    # Edit eula.txt to accept the EULA
    sed -i 's/false/true/g' eula.txt
  fi
fi

# Add RAM options to Java options if necessay
if [ ! -z "${MC_RAM}" ]
then
  JAVA_OPTS="-Xms${MC_RAM} -Xmx${MC_RAM} ${JAVA_OPTS}"
fi

# Stat seve
exec java -server ${JAVA_OPTS} -jar ${JAR_NAME} nogui
