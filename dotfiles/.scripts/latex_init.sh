#!/bin/bash

echo "RUNNING LATEX INIT"

function latex_doc () {
    cp $HOME/.doc_templates/main.tex $PWD
    cp $HOME/.doc_templates/bibliography.bib $PWD
    echo "DOCUMENT"
}

function latex_presentation () {
    cp $HOME/.doc_templates/presentation.tex $PWD
    cp $HOME/.doc_templates/bibliography.bib $PWD
    echo "PRESENTATION"
}

if [ $1 = "-doc" ]; then
    latex_doc
elif [ $1 = "-pres" ]; then
    latex_presentation
else
    echo "use -doc or -pres with this script!"
fi