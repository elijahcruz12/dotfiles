#!/bin/bash

# If the pwd is scripts/ then move to the parent directory
if [ $(basename $(pwd)) == "scripts" ]; then
    cd ..
fi

# Move zshrc

mv ~/.zshrc ~/.zshrc.bak

cp ./zsh/zshrc ~/.zshrc

echo "Moved zshrc"

echo "Done"

