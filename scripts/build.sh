#!/bin/sh

BASEDIR=$(dirname $0)
cd $BASEDIR
cd ..

# Build the thesis:
xelatex thesis
bibtex thesis
xelatex thesis
xelatex thesis
