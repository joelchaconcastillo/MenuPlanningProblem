rm *px*
for nday in 20 40 60;
do
  for px in 0.2 0.6 0.8;
 do
 for ITV in 0.0 0.2 0.4 0.6 0.8 1.0; 
  do
#    echo "ITV  ".$ITV." Px "${px}
     for i in History/*days_${nday}_*_Px_${px}_${ITV};
     do
      echo -n "\"${ITV}\" ">>n_${nday}_px_${px}
       tail -10 $i| awk '{print $NF}'| sort -n | head -n 1 >> n_${nday}_px_${px}
     done
     echo >>n_${nday}_px_${px}
     echo >>n_${nday}_px_${px}
#     echo "Dias.. $nday"
#   Rscript -e 'd<-scan("stdin", quiet=TRUE)' \
#	   -e 'cat(sprintf(summary(d), fmt="%.3f"))' < $nday \
#   	   -e 'print("\n")'
   	#-e 'print(summary(d), digits=20)' < $nday
   done
  done
done
