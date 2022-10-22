#!/bin/bash

# export GITHUB_USERNAME="${{ github.actor }}"
if [[ $BRANCH == 'master' && $GITHUB_EVENT_NAME == 'push' ]]; then
    echo "ENV=prod" >> "$GITHUB_ENV"
    export ENV=prod

elif [[ $BRANCH == 'dev' && $GITHUB_EVENT_NAME == 'push' ]]; then
    echo "ENV=dev" >> "$GITHUB_ENV"
    export ENV=dev

elif [[ $BRANCH == 'qa' && $GITHUB_EVENT_NAME == 'push' ]]; then
    echo "ENV=qa" >> "$GITHUB_ENV"
    export ENV=qa
fi