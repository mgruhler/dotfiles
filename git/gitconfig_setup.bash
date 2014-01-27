#!/bin/bash

GITIGNOREPATH=$HOME"/.gitignore_global"
echo $GITIGNOREPATH

# setup git user
git config --global user.name "ipa-mig"
git config --global user.email Matthias.Gruhler@ipa.fraunhofer.de

# setup editors and tools
git config --global core.editor vim
git config --global merge.tool meld
git config --global diff.tool meld

# add excludesfile
git config --global core.excludesfile $GITIGNOREPATH


