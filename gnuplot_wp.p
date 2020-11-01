set terminal canva
set grid
set style data histograms
set style fill solid 1.00 border -1
set title "Work progress"
set ylabel "Pourcentage"
set xtic out rotate by 45
set xtic font ",12"
set output "test.html"
plot "ll.txt" using 2:xtic(1) title "Avancement"
