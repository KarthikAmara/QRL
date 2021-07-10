
close all;
clear all;
javaaddpath('/MATLAB Drive/javase-3.3.0.jar');
javaaddpath('/MATLAB Drive/core-3.3.0.jar');
% encode & decoding a new QR code
colord_corners = 1; 
%0 if standard black alignment 
bw_code = 1;
%encode all three channels with all of data and then decoding them.

m='Kallam Haranadha Reddy institute of technology';

test_encode=  ~(encode_qr_3c(m,[256 256],colord_corners,bw_code));
test_encode=double(test_encode);
figure;imagesc(test_encode);axis image;
imshow(test_encode,'InitialMagnification','fit');



















disp('ans = []')
disp(m);
