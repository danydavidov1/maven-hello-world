#/bin/bash

version=$(mvn help:evaluate -Dexpression=project.version -q -DforceStdout)
NEXTVERSION=$(echo ${version} | awk -F. -v OFS=. '{$NF += 1 ; print}')
mvn versions:set -DnewVersion=$NEXTVERSION
