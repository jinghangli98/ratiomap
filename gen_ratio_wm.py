#!/usr/bin/env python3

import sys
import nibabel as nib
import numpy as np
import pdb

segmentation=sys.argv[1]
ratio=sys.argv[2]
output=sys.argv[3]

wm_mask = nib.load(segmentation).get_fdata()
wm_mask = np.array(wm_mask == 2) + np.array(wm_mask == 41)

ratio_nii = nib.load(ratio).get_fdata() * wm_mask
ratio_nii = nib.Nifti1Image(ratio_nii, affine=nib.load(ratio).affine)
nib.save(ratio_nii, output)

