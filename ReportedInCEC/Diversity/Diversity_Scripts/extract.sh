##Borrar todos los ficheros que contengan un postfijo "GENERAL"
rm *GENERAL
#Revisar para cad día...
for day in 20 40 60 ;
 do
 #Revisar para cada algoritmo
  for i in $(cat files) ; 
  do
  #Imprimir el algoritmo 
    echo $i
    #Revisar en cada algoritmo para todas las semillas
     for result in $(ls ${i}*_${day}Days*);
     do
      ##Guardar un fichero de resultados
        #tail -11 $result | rev | cut -f1 -d' ' |rev | head -n 1 #>> ${i}_${day}_GENERAL
        tail -11 $result | head -n 10 | rev | cut -f1 -d' ' |rev | sort -n | head -n 1 >> ${i}_${day}_GENERAL
     done
  done
done
