# % $Id: rmsd.tcl,v 1.3 2005/02/18 17:56:49 mbach Exp $

set outfile [open RMSD-AL6-D1653A-E1.dat w];                                             
set nf [molinfo top get numframes]
set frame0 [atomselect top "protein and backbone and noh" frame 0]
set sel [atomselect top "protein and backbone and noh"]
set body0 [atomselect top "segname AL6 and backbone and noh" frame 0]
set body [atomselect top "segname AL6 and backbone and noh"]
set all [atomselect top all]

# rmsd calculation loop
for {set i 1 } {$i < $nf } { incr i } {
    $sel frame $i
    $body frame $i
    $all frame $i
    $all  move [measure fit $sel $frame0]
    puts $outfile "[measure rmsd $body $body0]"
}
close $outfile
