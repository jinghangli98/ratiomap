#!/bin/bash
#SBATCH --job-name=biasCorrect
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=16GB
#SBATCH --time=99:00:00
#SBATCH --array=1-2
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jil202@pitt.edu
#SBATCH --account=tibrahim
#SBATCH --cluster=smp

#01
module load matlab

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
# Define an array of input filenames
T2s=(/ix1/tibrahim/jil202/ratiomap/img/T2w/*.nii)
current_T2=${T2s[$SLURM_ARRAY_TASK_ID - 1]}
current_T2name=$(echo $current_T2 | rev | cut -d'/' -f1 | rev | cut -d'_' -f2)
current_T2date=$(echo $current_T2 | rev | cut -d'/' -f1 | rev | cut -d'_' -f3)

current_T1=(/ix1/tibrahim/jil202/ratiomap/img/T1w/*$current_T2name*$current_T2date*)

T1_name=$(echo "$current_T1" | rev | cut -d'/' -f1 | rev)
T1_name=$(echo "$T1_name" | cut -d'.' -f1)
T1_name=$(echo "$T1_name" | cut -d'_' -f2-3)

current_folder=$(echo "$current_T1" | cut -d'/' -f1-6)/derivatives
ratio_output="$current_folder/ratiomap/$T1_name"

mkdir -p $ratio_output
echo ratio $current_T1 $current_T2 $ratio_output
ratio $current_T1 $current_T2 $ratio_output





