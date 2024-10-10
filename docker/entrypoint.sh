#!/bin/bash

set -e

# echo '----------------------ENV-------------------------'
# printenv
# echo '--------------------------------------------------'

pdflatex -output-directory=/out \
    --interaction=batchmode \
    --jobname="$RESUME_NAME" /src/resume.tex

echo "Built $(pwd)/$RESUME_NAME.pdf"
