#!/usr/bin/gnuplot

# ===================================================================
#                   R D F   G N U P L O T   S C R I P T
# ===================================================================
#
#   Project        : Machine Learning Interatomic Potentials: A Computational Guide
#   System         : Liquid Water (512 molecules)
#   Property       : Radial Distribution Functions (RDF)
#
# -------------------------------------------------------------------
#   Output file    : rdf.512.nvt.pdf
#   Layout         : 3 × 1 (gOO, gOH, gHH)
#
# -------------------------------------------------------------------
#   Authors        : Tainá C. Alves and Márcio S. Gomes Filho
#   Version        : 1.0
#   Year           : 2026
# ===================================================================


#####################################################################
# ----------------------- TERMINAL SETUP ----------------------------
#####################################################################

set encoding iso_8859_1
set terminal pdfcairo enhanced color font "Helvetica,24" size 7,8
set output "rdf.512.nvt.pdf"

set multiplot layout 3,1


#####################################################################
# ----------------------- g_OO(r) -----------------------------------
#####################################################################

unset label
set label 1 "a)" at -0.5,4 font "Helvetica,25"

set border lw 1.1 lc rgb "black"
set xtics textcolor rgb "black"
set ytics textcolor rgb "black"

set xrange [0.5:10]
set yrange [-0.1:4]
set ytics (0,1,2,3,4)

set key spacing 1.05 font "Helvetica,24"
set ylabel "g_{OO}"

plot "rdf.O-O.dat" using 1:2 w points pt 6 ps 1 lc rgb "#4593c5" t "DPMD - 512 H_{2}O"


#####################################################################
# ----------------------- g_OH(r) -----------------------------------
#####################################################################

unset label
set label 2 "b)" at -0.5,2   font "Helvetica,25"

set xrange [0.5:10]
set yrange [-0.1:2]
set ytics (0,1,2,3,4)

unset key
set ylabel "g_{OH}"

plot "rdf.O-H.dat" using 1:2 w points pt 6 ps 1 lc rgb "#4593c5" t ""


#####################################################################
# ----------------------- g_HH(r) -----------------------------------
#####################################################################

unset label
set label 3 "c)" at -0.5,3.6 font "Helvetica,25"

set border lw 1.1 lc rgb "black"
set xtics textcolor rgb "black"
set ytics textcolor rgb "black"

set xrange [0.5:10]
set yrange [-0.1:3.6]
set ytics (0,1,2,3,4)

unset key
set xlabel "r [{\305}]"
set ylabel "g_{HH}"

plot "rdf.H-H.dat" using 1:2 w points pt 6 ps 1 lc rgb "#4593c5" t ""


#####################################################################
# ----------------------- FINALIZATION -------------------------------
#####################################################################

unset multiplot
set output
