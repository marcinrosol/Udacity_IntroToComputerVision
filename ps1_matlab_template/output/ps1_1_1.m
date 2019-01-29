clear
clc
close all
img = imread('input/ps1_input0.png');
imshow(img)
BW = edge(img, 'Canny');
imshow(BW)