# ===================================================================
#                   G E O M E T R Y   C O N V E R T E R
# ===================================================================
#
#   Project        : Machine Learning Interatomic Potentials: A Computational Guide
#   Purpose        : Generate SIESTA geom.in from XYZ file
#
#   Input file     : water.xyz
#   Output file    : geom.in
#
#   Species Index  : O → 1
#                    H → 2
#
#   Standard usage : python xyz_to_geom.py
#
# -------------------------------------------------------------------
#   Authors  : Tainá C. Alves and Márcio S. Gomes Filho
#   Version  : 1.0
#   Year     : 2026
# ===================================================================

import numpy as np

#####################################################################
# ----------------------- READ XYZ FILE -----------------------------
#####################################################################

# Reading the name of atoms in .xyz file
file_name = "water.xyz"
atoms = np.loadtxt(file_name, unpack=True, usecols=[0], skiprows=2, dtype=str)

# Reading the atoms coordinates 
x, y, z = np.loadtxt(file_name, unpack=True, usecols=[1,2,3], skiprows=2, dtype=float)


#####################################################################
# ----------------------- SPECIES MAPPING ---------------------------
#####################################################################

name_of_atoms = np.zeros(len(x))

for i in range(len(x)):
    if atoms[i] == "O":
        name_of_atoms[i] = "1"
    if atoms[i] == "H":
        name_of_atoms[i] = "2"

print(name_of_atoms)


#####################################################################
# ----------------------- WRITE geom.in -----------------------------
#####################################################################

out_file = "geom.in"

np.savetxt(
    out_file,
    np.column_stack((x, y, z, name_of_atoms)),
    fmt=["%15.8f", "%15.8f", "%15.8f", "%4i"]
)
