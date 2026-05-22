import imageio.v3 as iio3
import argparse
import numpy as np
from skimage.filters import gaussian, threshold_li
from skimage.measure import label
from skimage.segmentation import watershed, clear_border
from skimage.morphology import remove_small_objects
from skimage.feature import peak_local_max
from scipy import ndimage as ndi
from pathlib import Path


def segment_image(input_path: Path, output_path: Path) -> None:
    """Segment the nuclei in a single image.

    Parameters
    ----------
    input_path : Path
        Path of input image
    output_path : Path
        Path to write segmented output to
    """

    image = iio3.imread(input_path)

    # gaussian blur
    blurred_image = gaussian(image, sigma=3)

    # threshold, and remove any small objects
    threshold = threshold_li(blurred_image)
    thresholded_image = blurred_image > threshold
    thresholded_image = remove_small_objects(thresholded_image, max_size=2000)

    # watershed to split touching nuclei
    distance = ndi.distance_transform_edt(thresholded_image)
    blurred_distance = gaussian(distance, sigma=6)
    coords = peak_local_max(
        blurred_distance,
        min_distance=7,
        footprint=np.ones((3, 3)),
        labels=thresholded_image
    )
    mask = np.zeros(distance.shape, dtype=bool)
    mask[tuple(coords.T)] = True
    markers = label(mask)
    nuclei = watershed(-distance, markers, mask=thresholded_image)

    # remove items touching the image border
    nuclei = clear_border(nuclei)

    # save segmented image to new file
    output_path.parent.mkdir(parents=True, exist_ok=True)
    iio3.imwrite(output_path, nuclei)


def main():
    """
    Read input / output paths from command-line arguments, then trigger
    segmentation.

    Help text for this script can be printed with 'python segment_image.py --help'
    """

    parser = argparse.ArgumentParser(
        description="Segment the nuclei in a single image, and write to an output file"
    )
    parser.add_argument("input_path", help="path of the input image")
    parser.add_argument("output_path", help="path of the output image")
    args = parser.parse_args()

    segment_image(Path(args.input_path), Path(args.output_path))


if __name__ == "__main__":
    main()
