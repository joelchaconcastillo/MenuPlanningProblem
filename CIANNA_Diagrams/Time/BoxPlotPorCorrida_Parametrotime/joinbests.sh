rm *px*
for min in 360 1440 2880;
do
 for nday in 20 40 60;
 do
   for px in 0.2 0.6;
  do
  for ITV in 0.2 0.4; 
   do
 #    echo "ITV  ".$ITV." Px "${px}
      for i in History/*days_${nday}_min_${min}_*_Px_${px}_${ITV};
      do
       echo -n "\"${min}\" ">>n_${nday}_px_${px}_ITV_${ITV}
        tail -10 $i| awk '{print $NF}'| sort -n | head -n 1 >> n_${nday}_px_${px}_ITV_${ITV}
      done
      echo >>n_${nday}_px_${px}_ITV_${ITV}
      echo >>n_${nday}_px_${px}_ITV_${ITV}
 #     echo "Dias.. $nday"
 #   Rscript -e 'd<-scan("stdin", quiet=TRUE)' \
 #	   -e 'cat(sprintf(summary(d), fmt="%.3f"))' < $nday \
 #   	   -e 'print("\n")'
    	#-e 'print(summary(d), digits=20)' < $nday
    done
   done
 done
done

for i in n_*;
do
  head -n -2 $i > tmp;
  mv tmp $i;
done
