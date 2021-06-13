# QRL
Quick Layered Response using MATLAB

  Various forms of 2-dimensional (2D) barcodes have become popular due to their ease 
of readability and their storage capacity. Notable examples of 2D barcode standards 
include the QR code and the Data Matrix. It is also possible to make such barcodes 
colored, in effect increasing capacity through wavelength-division multiplexing. 
These 3-dimensional (3D) barcodes have been created in schemes such as 
SpectraCode, Mobile Multi-Colored Composite (MMCC) and Microsofts High 
Capacity Color Barcode (HCCB). Of these schemes, only the HCCB standard has 
gained traction, but is not aimed at increasing data capacity compared with black and 
white codes.

  This project implements a method for color barcoding using Android devices as a 
reading platform, built on top of Google’s ZXing (”Zebra Crossing”) library. The new 
color barcode, called a Quick Layered Response (QLR, pronounced ”color”) Code, is 
three QR codes superimposed in different color channels. The corners of the code are 
used to correct color based on lighting conditions, and once color is corrected, the 
three layers are separated, sampled and binarized and decoded as standard QR codes. 
The color balancing technique also allows for any three colors to be used to construct 
the bar code, as long as the combination of their RGB values are linearly independent.
  
  A variety of attempts have been made at creating color barcoding schemes. MMCC 
codes were developed to target a variety of mobile cameras, including very low 
quality ones. HCCB codes are capable of using eight colors, but the basic version uses 
four which does not fully utilize the three independent color detectors of an Android 
camera. Other variants, like Paper Memory (PM) Codes, are overly sensitive to noise 
in the color spectrum. PM Codes claim to be able to use up to 17,000 different colors 
to encode information, but this scheme would require overly complex error correction 
to account for the inevitably large reading bit error rate when using an Android to 
capture data. As a further difference, we are approaching the problem by viewing the 
color channels as three separate channels. In other words, we are not concerned with 
matching our eight (23 for three binary channels) color possibilities correctly, but 
rather we are concerned with properly deconstructing the individual channels to 
grayscale and then matching the values to the correct value. Our codes are based on 
the QR Code due to the fact that it is widely used. A similar process could be used to 
construct color barcodes from most black and white barcodes.
