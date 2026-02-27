# Machine Learning Interatomic Potentials: A Computational Guide 💧🤖

[![DeepMD-kit](https://img.shields.io/badge/DeepMD--kit-v2.2-blue)](https://github.com/deepmodeling/deepmd-kit)
[![LAMMPS](https://img.shields.io/badge/LAMMPS-Compatible-green)](https://www.lammps.org/)

This repository contains the supplementary material, codes, and practical tutorials related to the chapter **"Machine Learning Interatomic Potentials: A Computational Guide"**, published in the proceedings of "2nd ICP Workshop on Quantum and Statistical Physics".

The goal of this material is to provide a practical (*hands-on*) guide for building a Neural Network Force Field (NNFF) for liquid water using the *Deep Potential* method implemented in the **DeepMD-kit** computational package, and its subsequent application in Molecular Dynamics simulations using **LAMMPS**.

---

## 👥 Authors

* **Tainá C. Alves** – Federal University of ABC (UFABC)
* **Márcio S. Gomes-Filho** – Federal University of ABC (UFABC)

---

## 📂 Repository Structure

The workflow is divided into three logical stages, reflecting the methodology discussed in the main text:

* `01_dft_data/`: Contains the scripts and parameters used to generate the *ab initio* reference data (Density Functional Theory).
* `02_deepmd_train/`: Contains the data conversion scripts, the `input.json` configuration file, and the necessary files to train the neural network.
* `03_lammps_md/`: Contains the LAMMPS input script (`in.water`) configured to use the generated potential (`graph.pb`), as well as analysis scripts (Python/Bash) to extract structural and dynamical properties (e.g., Radial Distribution Function).

---

## ⚙️ Requirements and Installation

For updated information about installing DeepMD-kit and LAMMPS, please visit:

* [DeepMD-kit](https://github.com/deepmodeling/deepmd-kit) (CPU or GPU version)
* [LAMMPS](https://docs.lammps.org/Manual.html) compiled with support for the `USER-DEEPMD` package
* Python 3.x (Libraries: `numpy`, `matplotlib`, `dpdata`)
