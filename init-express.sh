#! /bin/bash
# --------------------------------------------------------------------------------
# DESCRIPTION
# Automation Script to setup barebone directory and files for a node-express app. 
# Choice to add a blank typescript, webpack, and .env files
# project initialized with a git and default package.json file.
# --------------------------------------------------------------------------------
# OWNER
# Author: Aakash Jha <thedevdesigner@gmail.com>
# Version: 1.0.0
# --------------------------------------------------------------------------------

SRC="src"
SUB_FOLDERS=("models" "controllers" "interfaces" "types" "config" "constants" "lib")
GIT_IGNORE=".gitignore"
TS_CONFIG="tsconfig.json"
WP_CONFIG="webpack.config.ts"

# GET PROJECT NAME FROM USER
echo "What is your project called?"
read PROJECT_NAME

# CREATING ROOT FOLDER FOR PROJECT
mkdir $PROJECT_NAME

echo "Creating sub-folders...."
cd $PROJECT_NAME


# CREATING SRC IN ROOT
mkdir $SRC
touch "index.ts"

# REQUIRE TS CONFIG?
echo "Do you need a tsconfig.json file? (y/n)"
read IS_TS_NEEDED
if [ $IS_TS_NEEDED == "y" ]; then
    touch $TS_CONFIG
    echo ✅ Added an empty $TS_CONFIG file
fi

# REQUIRE WEBPACK CONFIG?
echo "Do you need a webpack.config.ts file? (y/n)"
read IS_WEBPACK_NEEDED
if [ $IS_WEBPACK_NEEDED == "y" ]; then
    touch $WP_CONFIG
    echo ✅ Added an empty $WP_CONFIG file
fi

# REQUIRE .env?
echo "Do you need a .env file? (y/n)"
read IS_ENV_NEEDED
if [ $IS_ENV_NEEDED == "y" ]; then
    touch .env
    echo "✅ Added .env file"
fi

touch $GIT_IGNORE
echo "✅ Added .gitignore file"

# ADD DEFAULT VALUES TO ENV FILE
echo "**/*node_modules" >> $GIT_IGNORE
echo "**/*env*" >> $GIT_IGNORE
echo "**/*build" >> $GIT_IGNORE
echo "**/*dist" >> $GIT_IGNORE
echo "**/*.DS_Store" >> $GIT_IGNORE

echo "✅ Added default values to gitignore"

# CREATING SUB-DIRECTORIES
cd $SRC
for FOLDER in ${SUB_FOLDERS[@]}; do
  mkdir $FOLDER
  echo ✅ Created $FOLDER directory
  cd $FOLDER
  touch "index.ts"
  cd ..
done
echo "✅ Directory setup done"

# INITIALIZE GIT REPO
# git init
echo "✅ Initialized a new git repo"

# INITIALIZE EMPTY NODE PROJECT
cd ..
npm init -y
echo "✅ Initialized a new node project with default package.json"
