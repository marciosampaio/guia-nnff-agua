# ===================================================================
#                 D E E P M D   D A T A   C O N V E R S I O N
# ===================================================================
#
#   Project   : Machine Learning Interatomic Potentials: A Computational Guide
#   System    : H2O – AIMD (SIESTA)
#   Purpose   : Convert SIESTA AIMD output to DeepMD raw format
#
# -------------------------------------------------------------------
#   Input file        : water.out
#   Input format      : siesta/aimd_output
#   Output directory  : deepmd_data/
#   Output format     : deepmd/raw
#
# -------------------------------------------------------------------
#   Authors  : Tainá C. Alves and Márcio S. Gomes Filho
#   Version : 1.0
#   Year    : 2026
# ===================================================================

import dpdata
import numpy as np
from dpdata import LabeledSystem
from glob import glob


# ==============================================================
# 1. Convert SIESTA AIMD output → DeepMD raw format
# ==============================================================

# Load SIESTA AIMD trajectory
dsys = dpdata.LabeledSystem(
    'water.out',
    fmt='siesta/aimd_output',
    prec=np.float32
)

# Export to DeepMD raw format
dsys.to(
    'deepmd/raw',
    'deepmd_data',
    set_size=dsys.get_nframes(),
    prec=np.float32
)
