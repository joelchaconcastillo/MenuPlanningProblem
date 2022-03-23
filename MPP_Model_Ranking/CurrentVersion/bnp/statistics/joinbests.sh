for nday in 20 40 60;
do
  for px in 0.0 0.2 0.4 0.6 0.8 1.0;
  do
    rm $nday
     for i in ../History/*days_${nday}_*_Px_${px};
     do
       tail -10 $i| awk '{print $NF}'| sort -n | head -n 1 >> $nday
     done
#     echo "Dias.. $nday"
   Rscript -e 'd<-scan("stdin", quiet=TRUE)' \
	   -e 'cat(sprintf(summary(d), fmt="%.10f"))' < $nday \
	   -e 'print("\n")'
#	   -e 'options(digits = 22)'\
#	   -e 'cat(print(summary(d), digits=20))' < $nday

   	#-e 'print(summary(d), digits=20)' < $nday
   done
done
