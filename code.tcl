mol load pdb 2w05.pdb
mol load pdb 7kjs.pdb
[atomselect 0 "protein and name CA and same residue as within 5 of resname FRT"] writepdb "bindingsite1.pdb"
[atomselect 1 "protein and name CA and same residue as within 5 of resname WG1"] writepdb "bindingsite2.pdb"

set center1 [atomselect 0 "protein and name CA and same residue as within 5 of resname FRT"]
set center2 [atomselect 1 "protein and name CA and same residue as within 5 of resname WG1"]

set masscenter1 [measure center $center1]
set masscenter2 [measure center $center2]

puts $masscenter1
puts $masscenter2

[atomselect 0 "protein and not water"] writepdb "protein1_2w05_clean.pdb"
[atomselect 1 "protein and not water"] writepdb "protein2_7kjs_clean.pdb"

[atomselect 0 "resname FRT"] writepdb "ligand1_2w05_clean.pdb"
[atomselect 1 "resname WG1"] writepdb "ligand2_7kjs_clean.pdb"

mol load pdb bindingsite1.pdb
mol load pdb bindingsite2.pdb

set com1 [atomselect 2 "index 1 to 15"]
set com2 [atomselect 3 "index 1 to 15"]
set align1 [measure fit $com1 $com2]
set rmsd1 [measure rmsd $com1 $com2]

puts $align1
puts $rmsd1

