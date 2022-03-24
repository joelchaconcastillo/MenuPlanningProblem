rm *px*
for nday in 20 40 60;
do
for min in 360 1440 2880;
 do
   for px in 0.2 0.6;
  do
  for ITV in 0.2 0.4; 
   do
	  rm tmp
      for i in History/*days_${nday}_min_${min}_*_Px_${px}_${ITV};
      do
        tail -10 $i| awk '{print $NF}'| sort -n | head -n 1 >> tmp
      done
      echo "Dias.. $nday $min $px $ITV"
    Rscript -e 'd<-scan("stdin", quiet=TRUE)' \
 	   -e 'cat(sprintf(summary(d), fmt="%.3f"))' < tmp \
    	   -e 'print("\n")'
    	#-e 'print(summary(d), digits=20)' < $nday
    done
   done
 done
done

rm tmp
