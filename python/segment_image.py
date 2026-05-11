import imageio.v3 as iio3
import numpy as np
from skimage.filters import gaussian, threshold_li
from skimage.measure import label
from skimage.segmentation import watershed
from skimage.morphology import remove_small_objects
from skimage.feature import peak_local_max
from scipy import ndimage as ndi
import matplotlib.pyplot as plt

filename = "data/C1-images/C1-Rep1_DIV3_Cortical_r02c04f01-1.tiff"
image = iio3.imread(filename)

# gaussian blur
blurred_image = gaussian(image, sigma=3)

# threshold 
threshold = threshold_li(blurred_image)
thresholded_image = blurred_image > threshold

# watershed to split items?
distance = ndi.distance_transform_edt(thresholded_image)
coords = peak_local_max(distance, footprint=np.ones((3, 3)), labels=thresholded_image)
nuclei = watershed(-distance, mask=thresholded_image)

# connected components
nuclei = label(thresholded_image)

# filter small items
nuclei = remove_small_objects(nuclei, max_size=100)

iio3.imwrite(path, nuclei)




