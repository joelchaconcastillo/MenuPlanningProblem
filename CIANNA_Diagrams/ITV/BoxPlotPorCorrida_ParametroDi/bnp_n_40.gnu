MOEAD= "#99ffff"; CPDEA= "#4671d5"
#set terminal pngcairo
#set terminal postscript portrait enhanced mono dashed lw 1 "Helvetica" 14 
set terminal postscript enhanced 'Times' color 
set terminal postscript enhanced font "Helvetica" 22
set output "ITV_40days.eps" 
set key font ",18"
#set yrange [8229000:8260000]
set ylabel "Level of Repetition"
set xlabel "Initial Threshold Value"
set title "Instance of 40 Days"
set autoscale xfix
set format y "%.0f"
set xtics 0,0.2,1.0
set style fill solid 0.25 border -1
#set style boxplot nooutliers pointtype 7
set style data boxplot
set boxwidth 0.03

stats "n_40_px_0.8" using 2 nooutput
#
plot for [i=0:STATS_blocks-2] "n_40_px_0.2" using (-0.02+0.2*i):2 index i lt 1 lc rgb 'green' title "",\
for [i=STATS_blocks-1:STATS_blocks-1] "n_40_px_0.2" using (-0.02+0.2*i):2 index i lt 1 lc rgb 'green' title "Px=0.2",\
for [i=0:STATS_blocks-2] "n_40_px_0.6" using (0.02+0.2*i):2 index i lt 1 lc rgb 'red' title "",\
for [i=STATS_blocks-1:STATS_blocks-1] "n_40_px_0.6" using (0.02+0.2*i):2 index i lt 1 lc rgb 'red' title "Px=0.6",\
for [i=0:STATS_blocks-2] "n_40_px_0.8" using (0.06+0.2*i):2 index i lt 1 lc rgb 'blue' title "",\
for [i=STATS_blocks-1:STATS_blocks-1] "n_40_px_0.8" using (0.06+0.2*i):2 index i lt 1 lc rgb 'blue' title "Px=0.8"
