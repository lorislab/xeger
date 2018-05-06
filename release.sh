#!/bin/bash

export VERSION=1.0.0-SNAPSHOT
export RELEASE=$1

git clean -f && git reset --hard origin/master

mvn -DtagNameFormat=${RELEASE} -DreleaseVersion=${RELEASE} -DdevelopmentVersion=${VERSION} -DpushChanges=false -DlocalCheckout=true -DpreparationGoals=initialize -Darguments="-DskipTests" release:prepare release:perform -B 

git push origin $RELEASE

