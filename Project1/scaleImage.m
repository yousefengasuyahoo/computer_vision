function [img] = scaleImage(in_img);
img = imresize(in_img,size(in_img)/3);