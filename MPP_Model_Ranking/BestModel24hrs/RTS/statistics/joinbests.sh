for nday in 20 40 60;
do
 rm $nday
  for i in ../History/*days_${nday}_*;
  do
    tail -10 $i| awk '{print $NF}'| sort -n | head -n 1 >> $nday
  done
  echo "Dias.. $nday"
Rscript -e 'd<-scan("stdin", quiet=TRUE)' \
	-e 'print(summary(d), digits=10)' < $nday
done
