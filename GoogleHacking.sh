#!/bin/bash

if [ "$1" = ""]
then

echo "Please define your target, ex: desecsecurity.com"

else

lynx --dump "https://google.com/search?&q=site:$1+ext:pdf" | grep ".pdf" | cut -d "=" -f 2 | egrep -v "site|google" | sed 's/...$//' > resultados

cat resultados | rev | cut -d "/" -f1 | rev > arquivos

for url in $(cat resultados);
do

wget $url

done


for files in $(cat arquivos);
do

exiftool $files

echo "\n\n"

rm $files

done



fi
