for i in ls *Pair*;
do
   echo $i
   Rscript -e 'd<-scan("stdin", quiet=TRUE)' \
	   -e 'cat(sprintf(summary(d), fmt="%.10f"))' < $i \
	   -e 'print("\n")'
done
