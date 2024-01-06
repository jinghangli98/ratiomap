#!/usr/bin/env python3

import numpy as np
import ants
import sys

T1 = sys.argv[1]
T2 = sys.argv[2]
output = sys.argv[3]

T1 = ants.image_read(T1)
T2 = ants.image_read(T2)

registration = ants.registration(fixed=T1, moving=T2, type_of_transform='Rigid')

transformation_matrix = registration['fwdtransforms'][0]
registered_image = ants.apply_transforms(fixed=T1, moving=T2, transformlist=transformation_matrix)

ratio = (T1)/(registered_image+1)
ants.image_write(ratio, f"{output}")
