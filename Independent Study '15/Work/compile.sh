#!/bin/bash
if [ -n "$1" ]
then
  directory=$1      # If directory name given as a script argument...
else
  directory=.   # Otherwise use current working directory.
fi  

#  Assumes all files in the target directory are tex files,
#+ with a ".tex" filename suffix.

for file in $directory/*.tex    # Filename globbing.
do
	filename=${file%.*x}      #  Strip ".tex" suffix off filename
                            #+ ('.*x' matches everything
			    #+ between '.' and 'c', inclusive).
	echo $filename  
	
done
# Run pdflatex
/usr/texbin/pdflatex -synctex=1 -interaction=nonstopmode $filename.tex
# View pdf
open $filename.pdf