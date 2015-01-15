#!/bin/bash
#set version from travis_tag if it found
if [[ $TRAVIS_TAG =~ ^[0-9]+\.[0-9]+\.[0-9]+(-[0-9A-Za-z-]+)?$ ]]; then
  echo "Setting build version from tag $TRAVIS_TAG!"
  myVer=$(echo $TRAVIS_TAG | sed -e s/^v//)
  mvn versions:set "-DnewVersion=$myVer"
fi
mvn install -DskipTests=true -DfinalName=sharpen