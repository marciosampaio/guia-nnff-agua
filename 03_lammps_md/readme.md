## ▶ HOW TO RUN — COMPLETE WORKFLOW

# =====================================================================
# 03_lammps_md — Molecular Dynamics + RDF Analysis Workflow
# =====================================================================
#
# This section describes the full execution pipeline:
#   1) Run Molecular Dynamics (LAMMPS)
#   2) Compute RDF (VMD)
#   3) Generate plots (gnuplot)
#
# IMPORTANT:
# - Detailed instructions and adjustable parameters are documented inside each individual input/script file.
# - Check relative paths carefully before running.
# - Make sure required software is properly installed.
#
# Required:
#   - LAMMPS (compiled with USER-DEEPMD)
#   - DeepMD model file
#   - VMD
#   - gnuplot
#
# =====================================================================
# 1️⃣ RUN MOLECULAR DYNAMICS
# =====================================================================

# Go to the input directory
cd 01_input

# Run LAMMPS (example: 300 K, 31383 seed)
lmp -in inputMD-NVT.in -var Temp 300 -var seed 31383

# Make sure that the path to the trained model inside inputMD-NVT.in is correct.

# Expected output files:
#   prod.NVT.water.lammpstrj      → trajectory file
#   thermo.NVT.out             → thermodynamic data
#   prod.restart.NVT.${T}      → restart file


# =====================================================================
# 2️⃣ COMPUTE RDF USING VMD
# =====================================================================

# Copy trajectory to analysis folder
cp prod.NVT.water.lammpstrj ../02_analysis/

# Enter analysis directory
cd ../02_analysis

# Run VMD in text mode
sh run_rdf.sh

# This executes internally:
#   vmd -dispdev text -e vmd_rdf-lammps.tcl

# Expected RDF output files:
#   rdf.O-O.dat
#   rdf.O-H.dat
#   rdf.H-H.dat


# =====================================================================
# 3️⃣ GENERATE RDF PLOTS
# =====================================================================

# Still inside 02_analysis
gnuplot plot_RDF.gp

# Output:
#   rdf.512.nvt.pdf
#
