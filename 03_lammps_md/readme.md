# ▶ HOW TO RUN — Molecular Dynamics + RDF Analysis

## 📁 03_lammps_md — MD Simulation & Structural Analysis

This directory contains the complete workflow for:

1️⃣ Running Molecular Dynamics (LAMMPS + DeepMD)  
2️⃣ Computing Radial Distribution Functions (RDF) using VMD  
3️⃣ Generating plots using gnuplot

---

## ❗ Important Notes

- Detailed instructions and adjustable parameters are documented inside each individual input/script file.
- Always verify relative paths before running (example: DeepMD model path inside `inputMD-NVT.in`).
- Ensure all required software is properly installed and accessible in your environment.

---

## 🧰 Required Software

- 🔬 LAMMPS (compiled with USER-DEEPMD)
- 🧠 DeepMD trained model file
- 🎬 VMD
- 📈 gnuplot

---

## 📂 Directory Structure

01_input/  
    └── inputMD-NVT.in        → Main LAMMPS input file

02_analysis/  
    ├── run_rdf.sh                        → Shell script to compute RDF  
    ├── vmd_rdf-lammps.tcl        → VMD RDF script  
    └── plot_RDF.gp                      → gnuplot plotting script

---

## 🚀 COMPLETE WORKFLOW

## 1️⃣ Run Molecular Dynamics (LAMMPS)

Go to input directory

`cd 01_input`

Run LAMMPS (example: 300 K, seed 31383)

`lmp -in inputMD-NVT.in -var Temp 300 -var seed 31383`

🔎 Make sure the path to the trained DeepMD model inside inputMD-NVT.in is correct.

📤 Expected Output Files

- prod.NVT.water.lammpstrj → Trajectory file
- thermo.NVT.out → Thermodynamic data
- prod.restart.NVT.${T} → Restart file

## 2️⃣ Compute RDF Using VMD

Copy trajectory to analysis folder

`cp prod.NVT.water.lammpstrj ../02_analysis/`

Enter analysis directory

`cd ../02_analysis`

Run VMD in text mode

`sh run_rdf.sh`

Internally, this executes:

`vmd -dispdev text -e vmd_rdf-lammps.tcl`

📤 Expected RDF Output Files

- rdf.O-O.dat
- rdf.O-H.dat
- rdf.H-H.dat

## 3️⃣ Generate RDF Plots

Still inside 02_analysis, run:

`gnuplot plot_RDF.gp`

📊 Output

- rdf.512.nvt.pdf
