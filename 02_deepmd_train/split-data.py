# ===================================================================
#                D E E P M D   D A T A   P R E P A R A T I O N
# ===================================================================
#
#   Project        : Machine Learning Interatomic Potentials: A Computational Guide
#   System         : H2O Dataset (DeepMD raw format)
#   Purpose        : Train / Validation split
#
# -------------------------------------------------------------------
#   Input directory     : deepmd_data/
#   Output directories  :
#       • train_data/
#       • validation_data/
#
#   Training set        : 1.5 % (uniformly spaced frames + shuffled)
#   Validation set      : 0.5 % (random selection)
#
# -------------------------------------------------------------------
#   Files processed :
#       • energy.raw
#       • force.raw
#       • coord.raw
#       • box.raw
#       • virial.raw
#
# -------------------------------------------------------------------
#   Authors  : Tainá C. Alves and Márcio S. Gomes Filho
#   Version : 1.0
#   Year    : 2026
# ===================================================================

import numpy as np
import pandas as pd
import os

# ==========================================================
# Reading DeepMD raw files
# ==========================================================

data_path = "deepmd_data"

energy_dft  = pd.read_csv(f"{data_path}/energy.raw",  header=None, sep=' ')
force_dft   = pd.read_csv(f"{data_path}/force.raw",   header=None, sep=' ')
coord_dft   = pd.read_csv(f"{data_path}/coord.raw",   header=None, sep=' ')
box_dft     = pd.read_csv(f"{data_path}/box.raw",     header=None, sep=' ')
virial_dft  = pd.read_csv(f"{data_path}/virial.raw",  header=None, sep=' ')

number_of_frames = len(energy_dft)

print("Number of frames:", number_of_frames)
print("All files same length:",
      len(virial_dft) == len(box_dft) == len(coord_dft) ==
      len(force_dft) == len(energy_dft))

# ==========================================================
# TRAINING DATA (1.5% uniformly spaced)
# ==========================================================

percent_train = 0.015
n_indices_train = int(number_of_frames * percent_train)

step_train = number_of_frames // n_indices_train
indices_train = np.arange(0, number_of_frames, step_train).tolist()

# Guarantee last frame is included
if indices_train[-1] != number_of_frames - 1:
    indices_train.append(number_of_frames - 1)

# Shuffle training indices
np.random.shuffle(indices_train)

print("Training frames:", len(indices_train))

# ==========================================================
# VALIDATION DATA (0.5% randomly selected)
# ==========================================================

percent_validation = 0.005
n_indices_validation = int(number_of_frames * percent_validation)

all_indices = np.arange(number_of_frames)

mask = np.ones(len(all_indices), dtype=bool)
mask[indices_train] = False

indices_validation_pool = all_indices[mask]

indices_validation = np.random.choice(
    indices_validation_pool,
    size=n_indices_validation,
    replace=False
).tolist()

print("Validation frames:", len(indices_validation))

# Verify no overlap
print("Overlap train/validation:",
      any(i in indices_train for i in indices_validation))

# ==========================================================
# Saving TRAIN and VALIDATION data
# ==========================================================

data_files = ['energy', 'force', 'coord', 'box', 'virial']

os.makedirs("train_data", exist_ok=True)
os.makedirs("validation_data", exist_ok=True)

for name in data_files:

    file_in = f"{data_path}/{name}.raw"
    df = pd.read_csv(file_in, header=None, sep=' ')

    # ---- Train ----
    df_train = df.iloc[indices_train]
    file_out_train = f"train_data/{name}.raw"
    np.savetxt(file_out_train, df_train.values, fmt='%.18e')

    # ---- Validation ----
    df_val = df.iloc[indices_validation]
    file_out_val = f"validation_data/{name}.raw"
    np.savetxt(file_out_val, df_val.values, fmt='%.18e')

print("Done.")
