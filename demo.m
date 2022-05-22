% clear old vairables
clear all;
close all;
clc;

% load data, please change it for your image
filename='data/4.bmp';
[filepath,name,ext]=fileparts(filename);
im=im2double(imread([filepath,'/',name,ext]));
[I,R,N]=Processing(im);

% Show results
figure;
subplot(1,2,1);imshow(im);title('Input');

% Enhanced images
gamma=2.2;
hsv=rgb2hsv(im);
I_gamma=real(I.^(1/gamma));
S_gamma=R .* I_gamma;
hsv(:,:,3)=S_gamma;
enhance = hsv2rgb(hsv);
subplot(1,2,2);imshow(enhance);title('Enhanced image');