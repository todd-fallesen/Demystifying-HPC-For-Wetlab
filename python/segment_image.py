import imageio.v3 as iio3
import argparse
import numpy as np
from skimage.filters import gaussian, threshold_li
from skimage.measure import label
from skimage.segmentation import watershed
from skimage.morphology import remove_small_objects
from skimage.feature import peak_local_max
from scipy import ndimage as ndi
import matplotlib.pyplot as plt
from pathlib import Path

def segment_image(input_path: Path, output_path: Path) -> None:
    image = iio3.imread(input_path)

    # gaussian blur
    blurred_image = gaussian(image, sigma=3)

    # threshold 
    threshold = threshold_li(blurred_image)
    thresholded_image = blurred_image > threshold

    # watershed to split items?
    distance = ndi.distance_transform_edt(thresholded_image)
    nuclei = watershed(-distance, mask=thresholded_image)

    # connected components
    nuclei = label(thresholded_image)

    # filter small items
    nuclei = remove_small_objects(nuclei, max_size=100)

    output_path.parent.mkdir(parents=True, exist_ok=True)
    iio3.imwrite(output_path, nuclei)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("input_path", help="path of the input image")
    parser.add_argument("output_path", help="path of the output image")
    args = parser.parse_args()

    segment_image(Path(args.input_path), Path(args.output_path))

if __name__ == "__main__":
    main()
