# ratiomap
ratiomap takes in T1w and T2w Niftiimages and calculates the T1w/T2w ratio map
## Example Usage
```
ratio /ix1/tibrahim/jil202/ratiomap/img/T1w/T1_639_20200128135731.nii /ix1/tibrahim/jil202/ratiomap/img/T2w/T2_639_20200128135731.nii /ix1/tibrahim/jil202/ratiomap/img/derivatives/ratiomap/639_20200128135731
```
I am leveraging ```spm12``` for bias-correction ```mri_synthseg``` for tissue segmentation ```mri_synthstrip``` for accurate skullstripping ```fcm-normalize``` for intensity normalization

The processed images will be saved at ```/ix1/tibrahim/jil202/ratiomap/img/derivatives/ratiomap/639_20200128135731```. The output includes ratiomaps in the subject space and the MNI space

Take a look at the commited code for implementation
