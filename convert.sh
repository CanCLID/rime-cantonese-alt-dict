#!/usr/bin/env bash

candidates=(
  jyut6ping3
  jyut6ping3.phrase
  jyut6ping3.lettered
)

schemes=(
  yale
  edu
  lau
  wong
)

for sc in ${schemes[@]}; do
  for file in ${candidates[@]}; do
    awk '{if (!x["..."]){print $0 > "a.tmp"; x[$0]++;} else {print $0 > "b.tmp";}}' source/$file.dict.yaml
    sed -E -f scripts/${sc}.sed b.tmp > c.tmp
#    if [ $sc==yale ]; then sed -E 's/([aeiou])(ng?|m|i|u|p|t|k)?([456])/\1h\2\3/g' -i c.tmp; fi
    cat a.tmp c.tmp > ${file}_${sc}.dict.yaml
    rm a.tmp b.tmp c.tmp
  done
done
