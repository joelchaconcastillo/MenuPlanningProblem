days=60
./distances "txt2/BNP_PairBasedCrossover_${days}Days_0.5_*" 20 10 $(($days*3))
./distances "txt2/RMDDC_PairBasedCrossover_${days}Days*" 20 10 $(($days*3))

./distances "txt2/COMB_3_3_PairBasedCrossover_${days}Days*" 20 10 $(($days*3))

./distances "txt2/Crowding_5_PairBasedCrossover_${days}Days*" 20 10 $(($days*3))


./distances "txt2/CDRW_PairBasedCrossover_${days}Days*" 20 10 $(($days*3))


./distances "txt2/Generational_PairBasedCrossover_${days}Days*" 20 10 $(($days*3))

