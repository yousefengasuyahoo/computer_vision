t1 = [0 0 0;0 0 0; 0 0 0];
t2 = [0 1 0 ;0 0 0;0 0 0];
t3 = [0 1 0;0 0 0;0 0 1];
t4 = [1 1 0;0 0 0;0 0 1];
t5 = [1 1 0;0 0 0;1 0 1];
t6 = [1 1 1;0 0 0;1 0 1];
t7 = [1 1 1;0 0 1;1 0 1];
t8 = [1 1 1;0 0 1;1 1 1];
t9 = [1 1 1;1 0 1;1 1 1];
t10 = [1 1 1;1 1 1;1 1 1];
img = imread('cat.jpg');
img_gray = rgb2gray(img);%converted to grayscale
img_size = size(img_gray);%size of original image
img_size_scaled = size(img_gray)*3;%scaled for halftoning 
ht_img = zeros(img_size_scaled(1,1),img_size_scaled(1,2));%initialize output image halftoned
for x=1:img_size(1,2)%concatenating for each pixel in ht_img
    for y=1:img_size(1,1)
      if 0 > img_gray(y,x) > 22
          ht_img(y,x)=cat(1,:,t10);
      elseif 22> img_gray(y,x) > 48
          ht_img(y,x)=cat(1,:,t9);
      elseif 48> img_gray(y,x) > 74
          ht_img(y,x)=cat(1,:,t8);
      elseif 74> img_gray(y,x) > 100
          ht_img(y,x)=cat(1,:,t7);
      elseif 100> img_gray(y,x) > 126
          ht_img(y,x)=cat(1,:,t6);
      elseif 126> img_gray(y,x) > 152
          ht_img(y,x)=cat(1,:,t5);
      elseif 152> img_gray(y,x) > 178
          ht_img(y,x)=cat(1,:,t4);
      elseif 178> img_gray(y,x) > 204
          ht_img(y,x)=cat(1,:,t3);
      elseif 204> img_gray(y,x) > 230
          ht_img(y,x)=cat(1,:,t2);
      elseif 230> img_gray(y,x) > 255
          ht_img(y,x)=cat(1,:,t1);
      end
    end
end