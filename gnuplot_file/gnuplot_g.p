set terminal canva
set grid
set style data histograms
set style fill solid 1.00 border -1
set title "Grade"
set yrange [0:20]
set xtic out rotate by 45
set xtic font ",12"
set output "test.html"
plot "nn.info" using 2:xtic(1) title "grade /20"
