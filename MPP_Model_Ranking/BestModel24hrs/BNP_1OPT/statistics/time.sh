for nday in 20 40 60;
do
 echo $nday
  for w in 10 20 30 40 50 60 70 80 90 100;
  do
     rm $nday
     for i in ../History/*days_${nday}_*;
     do
       
       head -n $w $i | tail -10 | awk '{print $NF}'| sort -n | head -n 1 >> $nday
     done
     echo "Dias.. $nday"
   Rscript -e 'd<-scan("stdin", quiet=TRUE)' \
   	-e 'sprintf(summary(d), fmt="%.3f")' < $nday
   	#-e 'print(summary(d), digits=20)' < $nday
   done
done
