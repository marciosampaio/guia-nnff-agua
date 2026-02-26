#!/usr/bin/gnuplot

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                               All-points
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set encoding iso_8859_1
#set terminal postscript eps enhanced  color 'Helvetica' font 24 size 7,8
#set output "rdf.512.nvt2.eps"

set terminal pdfcairo enhanced color font "Helvetica,24" size 7,8
set output "alves_rdf.512.nvt.pdf"

###set size 1, 2.1
set multiplot layout 3,1

###set size 1, 0.7
###set origin 0.0, 1.4

set border lw 1. lc rgb "black"
set xtics textcolor rgb "black"
set ytics textcolor rgb "black"

set ytics (0, 1,  2, 3.,4)

set xrange [2.2:10]
set yrange[-.1:4]
set key spacing 1.05  font "Helvetica, 24"

set ylabel "g_{OO}"
 

plot "rdf.O-O.dat"  us ($1):($2) w points pt 6 ps 1 lc rgb "#4593c5" t "DPMD - 512 H_{2}O", "goo_ref.dat" w  l dt 4 lw 3 lc rgb 'gray30' t 'Yao and Kanai', "soper-2013review-table5.dat.txt" us 1:2 w line dt 2 lc rgb "#ff0000" lw 3 t 'Soper'

#set size 0.3, 0.32
#set origin .125, 1.76
#set xrange [2.55:2.9]
#set yrange[3.1:3.45]
#set ytics (3.2, 3.4)  font "Helvetica, 15"
#set xtics (2.6, 2.8)  font "Helvetica, 15"

# set xtics ("2.8" 2.8 5)  font "Helvetica, 12"

#set xtics offset 0,graph 0.1
#set ytics offset 0,graph 0.15


#unset key 
#set ylabel ""
#plot "rdf.O-O.dat"  us ($1):($2) w points pt 6 ps 1 lc rgb "#0000FF" t "10\%", "goo_ref.dat" w  l dt 4 lw 3 lc rgb 'dark-gray' t 'Yao and Kanai', "soper-2013review-table5.dat.txt" us 1:2 w line dt 2 lw 3 t 'Soper'

#set size 0.4, 0.32
#set origin .3, 1.76
#set xrange [3.:5]
#set yrange[0.48:1.4]
#set ytics (0.6, 1.2)  font "Helvetica, 15"
#set xtics (3, 4,5)  font "Helvetica, 15"
## set log y
## set xtics ("2.8" 2.8 5)  font "Helvetica, 12"

#set xtics offset 0,graph 0.1
#set ytics offset 0,graph 0.15


#unset key 
#set ylabel ""
#plot "rdf.O-O.dat"  us ($1):($2) w points pt 6 ps 1 lc rgb "#0000FF" t "10\%", "goo_ref.dat" w  l dt 4 lw 2 lc rgb 'dark-gray' t 'Yao and Kanai', "soper-2013review-table5.dat.txt" us 1:2 w line dt 0 lw 4 t 'Soper'

###set size 1.,0.70
###set origin 0., 0.725

set ytics (0, 1,  2, 3.,4)
set border lw 1.1 lc rgb "black"
set xtics textcolor rgb "black"
set ytics textcolor rgb "black"
set xrange [0.5:10]

set yrange[-.1:2]
set key spacing 2
unset key

set ylabel "g_{OH}" offset  0,0
set label 1 "b)" at -0.5,2 font "Helvetica, 25"
set label 2 "a)" at -0.5,4.8 font "Helvetica, 25"
set label 3 "c)" at -0.5,-0.8 font "Helvetica, 25"


plot "rdf.O-H.dat"  us ($1):($2) w points pt 6 ps 1 lc rgb "#4593c5" t "10\%", "goh_ref.dat" w  l dt 4 lw 3 lc rgb 'gray30' t 'Yao and Kanai', "soper-2013review-table5.dat.txt" us 1:4 w line dt 2 lc rgb "#ff0000" lw 3 t 'Soper'
reset

###set size 1.,.70
###set origin 0, 0.050

set border lw 1.1 lc rgb "black"
set xtics textcolor rgb "black"
set ytics textcolor rgb "black"
set xrange [0.5:10]
set yrange[-.1:3.6]
unset key
 set xlabel "r [{\305}]"
 set ylabel "g_{HH}"  offset  0,0
 set ytics (0, 1,  2, 3.,4)


plot "rdf.H-H.dat"  us ($1):($2) w points pt 6 ps 1 lc rgb "#4593c5" t "10\%", "soper-2013review-table5.dat.txt" us 1:6 w line dt 2 lw 3 lc rgb "#ff0000" t 'Soper'


unset multiplot
###quit

###epstopdf rdf.512.nvt.eps

set output

