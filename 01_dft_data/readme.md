## ▶ HOW TO RUN — DFT DATA GENERATION (SIESTA AIMD)

# =====================================================================
# 01_dft_data — Ab Initio Molecular Dynamics (AIMD)
# =====================================================================
#
# This directory contains the input files and preprocessing scripts used to generate reference ab initio data for Deep Potential training.
#
# The calculations are performed using SIESTA (DFT-based AIMD).
#
# Workflow:
#   1) Prepare atomic geometry
#   2) Run AIMD simulation in SIESTA
#
# IMPORTANT:
# - Detailed parameters are documented inside water.AIMD.fdf
# - Make sure pseudopotentials are compatible with your SIESTA version
#
# Required software:
#   - SIESTA
#   - Python 3 (for preprocessing script)
#
# =====================================================================
# DIRECTORY STRUCTURE
# =====================================================================
#
# 01_preprocessing/
#   xyz_to_geom.py   → Converts .xyz file into geom.in (SIESTA format)
#
# 02_runAIMD/
#   water.AIMD.fdf   → Main SIESTA input file
#   H.psf            → Hydrogen pseudopotential
#   O.psf            → Oxygen pseudopotential
#
# =====================================================================
# 1️⃣ PREPARE GEOMETRY
# =====================================================================
#
# If starting from an XYZ file:
#
# Go to preprocessing folder:
#
#   cd 01_preprocessing
#
# Run:
#
#   python xyz_to_geom.py
#
# This generates:
#   geom.in
#
# Move geom.in to the input directory:
#
#   mv geom.in ../02_input/
#
# =====================================================================
# 2️⃣ RUN AIMD SIMULATION (SIESTA)
# =====================================================================
#
# Go to input directory:
#
#   cd ../02_input
#
# Run SIESTA:
#
#   siesta < water.AIMD.fdf > water.out
#
# Make sure H.psf and O.psf are present in the same directory
#
# =====================================================================
# 3️⃣ OUTPUT FILES
# =====================================================================
#
# Main outputs:
#
#   water.out        → Energies and SCF information
#   *.XV             → Atomic coordinates
#   *.MD             → MD history
#
