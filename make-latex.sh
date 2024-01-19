#!/bin/sh
#assemble and preprocess all the sources files



for filename in text/ch*.txt; do
   [ -e "$filename" ] || continue
   pandoc --lua-filter=lua/extras.lua "$filename" --to markdown | pandoc --lua-filter=lua/extras.lua --to markdown | pandoc --lua-filter=lua/Pro.lua --to markdown | pandoc --lua-filter=lua/AssoPro.lua --to markdown | pandoc --lua-filter=lua/AssiPro.lua --to markdown | pandoc --lua-filter=lua/Medip.lua --to markdown | pandoc --filter pandoc-fignos --to markdown | pandoc --top-level-division=chapter --citeproc  --to latex  > latex/"$(basename "$filename" .txt).tex"
done



pandoc -s latex/*.tex -o book.tex
pandoc -N --quiet --variable "geometry=margin=1.2in" --variable mainfont="Noto Sans Regular" --variable sansfont="Noto Sans Regular" --variable monofont="Noto Sans Regular" --variable fontsize=12pt --variable version=2.0 book.tex --pdf-engine=xelatex --toc -o book.pdf
