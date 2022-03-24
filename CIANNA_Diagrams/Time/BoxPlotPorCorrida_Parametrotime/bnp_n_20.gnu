MOEAD= "#99ffff"; CPDEA= "#4671d5"
#set terminal pngcairo
#set terminal postscript portrait enhanced mono dashed lw 1 "Helvetica" 14 
set terminal postscript enhanced 'Times' color 
set terminal postscript enhanced font "Helvetica" 22
set output "Time_20days.eps" 
set key font ",18"
set ylabel "Level of Repetition"
set xlabel "Time (min)"
set title "Instance of 20 Days"
set yrange [8229000:8245000]
#set logscale y 2
#set autoscale xfix
set format y "%.0f"
set xtics ("360" 0, "1440" 0.2, "2880" 0.4)
#set xtics 0,0.2,1.0
set style fill solid 0.25 border -1
#set style boxplot nooutliers pointtype 7
set style data boxplot
set boxwidth 0.03

stats "n_20_px_0.2_ITV_0.2" using 2 nooutput
#
plot for [i=0:STATS_blocks-2] "n_20_px_0.2_ITV_0.2" using (-0.02+0.2*i):2 index i lt 1 lc rgb 'green' title "",\
for [i=STATS_blocks-1:STATS_blocks-1] "n_20_px_0.2_ITV_0.2" using (-0.02+0.2*i):2 index i lt 1 lc rgb 'green' title "Px=0.2, ITV=0.2",\
for [i=0:STATS_blocks-2] "n_20_px_0.2_ITV_0.4" using (0.02+0.2*i):2 index i lt 1 lc rgb 'blue' title "",\
for [i=STATS_blocks-1:STATS_blocks-1] "n_20_px_0.2_ITV_0.4" using (0.02+0.2*i):2 index i lt 1 lc rgb 'blue' title "Px=0.2, ITV=0.4",\
for [i=0:STATS_blocks-2] "n_20_px_0.6_ITV_0.2" using (0.06+0.2*i):2 index i lt 1 lc rgb 'red' title "",\
for [i=STATS_blocks-1:STATS_blocks-1] "n_20_px_0.6_ITV_0.2" using (0.06+0.2*i):2 index i lt 1 lc rgb 'red' title "Px=0.6, ITV=0.2" ,\
for [i=0:STATS_blocks-2] "n_20_px_0.6_ITV_0.4" using (0.1+0.2*i):2 index i lt 1 lc rgb 'orange' title "",\
for [i=STATS_blocks-1:STATS_blocks-1] "n_20_px_0.6_ITV_0.4" using (0.1+0.2*i):2 index i lt 1 lc rgb 'orange' title "Px=0.6, ITV=0.4" #,\
