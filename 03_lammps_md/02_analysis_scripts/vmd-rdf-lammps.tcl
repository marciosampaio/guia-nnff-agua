mol load lammpstrj prod.NVT.water.lammpstrj

package require pbctools

set O [atomselect top "type 1"]
set H [atomselect top "type 2"]

set outfile [open rdf.O-O.dat w]
set gr0 [measure gofr $O $O delta 0.01 rmax 15.0 first 0 last -1 step 1 usepbc TRUE selupdate TRUE]

set r [lindex $gr0 0]
set gr [lindex $gr0 1]
set igr [lindex $gr0 2]
set isto [lindex $gr0 3]
foreach j $r k $gr l $igr m $isto {
    puts $outfile [format "%.4f\t%.4f\t%.4f\t%.4f" $j $k $l $m]
}
close $outfile

set outfile [open rdf.O-H.dat w]
set gr0 [measure gofr $O $H delta 0.01 rmax 15.0 first 0 last -1 step 1 usepbc TRUE selupdate TRUE]

set r [lindex $gr0 0]
set gr [lindex $gr0 1]
set igr [lindex $gr0 2]
set isto [lindex $gr0 3]
foreach j $r k $gr l $igr m $isto {
    puts $outfile [format "%.4f\t%.4f\t%.4f\t%.4f" $j $k $l $m]
}
close $outfile

set outfile [open rdf.H-H.dat w]
set gr0 [measure gofr $H $H delta 0.01 rmax 15.0 first 0 last -1 step 1 usepbc TRUE selupdate TRUE]

set r [lindex $gr0 0]
set gr [lindex $gr0 1]
set igr [lindex $gr0 2]
set isto [lindex $gr0 3]
foreach j $r k $gr l $igr m $isto {
    puts $outfile [format "%.4f\t%.4f\t%.4f\t%.4f" $j $k $l $m]
}
close $outfile

exit
