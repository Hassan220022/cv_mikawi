#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Navigate to the project directory
cd /personal_cv

# Pull the latest changes from the repository
git pull
git fetch --all
git reset --hard origin/main
