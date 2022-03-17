for nday in 20 40 60;
do
 echo $nday
     rm $nday
     for i in ../History/*days_${nday}_*;
     do
      tail -10 $i | awk '{print $NF}'| sort -n | head -n 1 >> $nday
     done
     echo "Dias.. $nday"
   Rscript -e 'd<-scan("stdin", quiet=TRUE)' \
   	-e 'sprintf(summary(d), fmt="%.3f")' < $nday
   	#-e 'print(summary(d), digits=20)' < $nday
done
