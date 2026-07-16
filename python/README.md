# Python example

Example python script for segmenting nuclei in a series of 2D tiff images.

## Conda environment

You will need to create a conda environment called `scikit-image-env` on your cluster. Follow your institution's instructions for setting this up.

This environment should contain `scikit-image` e.g.

```
conda create -n scikit-image-env python=3.12
conda activate scikit-image-env
pip install scikit-image
```

## Test data

This script uses a single directory of test data containing 9 2D tiff images. Download from [TBD - Zenodo link]

## Parts that need to be adapted for your cluster

In `job_submission_script.sh`:

- Update the `BASE_DIR` path to match the location of the test data
- Update the `TASK_SCRIPT` path to match the location of `python_seg_task_script.sh`

In `python_seg_task_script.sh`:

- Update the `#SBATCH --partition=ncpu` to match the name of the appropriate partition on your cluster
- Update the `ml Anaconda3` line, to match the name of the module containing conda on your cluster
- Update the path in the last line to match the location of `segment_image.py`

## Submitting the jobs

Run:
```
sbatch job_submission_script.sh
```

This will submit one job per input image, allowing them to be processed in parallel.

Segmented images will be written to `BASE_DIR/output` with an `_output` suffix. Slurm logs are inside `BASE_DIR`, in a sub-directory called `logs`. 
