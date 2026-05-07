# ▶ HOW TO RUN — Deep Potential Model Training

## 📁 02_deepmd_train — Data Preparation & Neural Network Training

This directory contains the workflow used to:

1️⃣ Convert DFT (SIESTA) output into DeepMD format  
2️⃣ Split the dataset into training and validation subsets  
3️⃣ Convert `.raw` files into DeepMD `set.xxx` format  
4️⃣ Train, freeze, and compress a Deep Potential model  

---

## ❗ Important Notes

- This repository provides the scripts and examples used in the workflow.
- Detailed parameters and adjustable options are documented inside each script and in `train_h20.json`.
- Always verify relative paths before running the scripts.

---

## 🧰 Required Software

- 🐍 Python 3  
- 📦 dpdata  
- 🔢 NumPy  
- 🧠 DeepMD-kit  

---

## 📂 Directory Structure

01_conversion/  
    └── siesta2dp.py → Converts SIESTA AIMD output (`water.out`) into DeepMD `.raw` format  

02_dataset/  
    ├── split-data.py → Splits `.raw` data into training and validation subsets  
    ├── raw_to_set.sh → Converts `.raw` files into DeepMD `set.xxx` format  
    └── O.psf          → Oxygen pseudopotential

03_training/  
    └── train_h20.json → DeepMD training configuration file  

---

# 🚀 COMPLETE WORKFLOW

---

## 1️⃣ Convert SIESTA Output to DeepMD Format

Make sure `water.out` exists from the previous DFT step.

Go to conversion directory:

```bash
cd 01_conversion
```

Run:

```bash
python siesta2dp.py
```

📤 Output:

- `deepmd_data/`
    - `box.raw`
    - `coord.raw`
    - `energy.raw`
    - `force.raw`
    - `virial.raw`

---

## 2️⃣ Split Training and Validation Data

Go to dataset directory:

```bash
cd ../02_dataset
```

Run:

```bash
python split-data.py
```

📤 Output:

- `training_data/`
- `validation_data/`

containing:

- `box.raw`
- `coord.raw`
- `energy.raw`
- `force.raw`
- `virial.raw`

🔎 This step:
- Selects training and validation frames randomly
- Shuffles the frames

---

## 3️⃣ Convert RAW Data into SET Format

The script `raw_to_set.sh` must be executed inside a directory containing `.raw` files.

Example:

```bash
cd training_data
./raw_to_set.sh
```

📤 Output:

- `set.000/`

---

## 4️⃣ Train Deep Potential Model

Go to training directory:

```bash
cd ../03_training
```

Run:

```bash
dp train train_h20.json
```

📤 Output:

- `model.ckpt*`
- `lcurve.out`
- training logs

---

## 5️⃣ Freeze Trained Model

After training is complete:

```bash
dp freeze -o graph.pb
```

📤 Output:

- `graph.pb`

This exports the trained model into a format compatible with LAMMPS.

---

## 6️⃣ Compress Model (Optional but Recommended)

For production molecular dynamics simulations:

```bash
dp compress -i graph.pb -o graph-compress.pb
```

📤 Output:

- `graph-compress.pb`

This compressed model is usually faster during LAMMPS simulations.

---

## 📊 Main Output Files

- `graph.pb` → Frozen Deep Potential model  
- `graph-compress.pb` → Compressed production model  
- `lcurve.out` → Training loss curve  
- `model.ckpt*` → TensorFlow checkpoints  
