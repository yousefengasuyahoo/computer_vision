function [ht_img] = halftone(imgname);
t1 = [0 0 0 ; 0 0 0 ; 0 0 0];
t2 = [0 1 0 ; 0 0 0 ; 0 0 0];
t3 = [0 1 0 ; 0 0 0 ; 0 0 1];
t4 = [1 1 0 ; 0 0 0 ; 0 0 1];
t5 = [1 1 0 ; 0 0 0 ; 1 0 1];
t6 = [1 1 1 ; 0 0 0 ; 1 0 1];
t7 = [1 1 1 ; 0 0 1 ; 1 0 1];
t8 = [1 1 1 ; 0 0 1 ; 1 1 1];
t9 = [1 1 1 ; 1 0 1 ; 1 1 1];
t10 = [1 1 1 ; 1 1 1 ; 1 1 1];
h = 1;% hieght index of hTone image
w = 1;% width index of hTone image
img = imread(imgname);%reading image by name input
img_gray = scaleImage(rgb2gray(img));%convert image to grayscale and scale it H/3 and W/3
img_size = size(img_gray);%size of original image
img_size_scaled = img_size*3;%scaled for halftoning 
ht_img = zeros(img_size_scaled(1,1),img_size_scaled(1,2));%initialize output image halftoned
for x=1:img_size(1,2)%concatenating for each pixel in ht_img
    for y=1:img_size(1,1)
      if img_gray(y,x) < 22
          ht_img(h:h+2,w:w+2)=t10;
      elseif img_gray(y,x) < 48
          ht_img(h:h+2,w:w+2)=t9;
      elseif img_gray(y,x) < 74
          ht_img(h:h+2,w:w+2)=t8;
      elseif img_gray(y,x) < 100
          ht_img(h:h+2,w:w+2)=t7;
      elseif img_gray(y,x) < 126
          ht_img(h:h+2,w:w+2)=t6;
      elseif img_gray(y,x) < 152
          ht_img(h:h+2,w:w+2)=t5;
      elseif img_gray(y,x) < 178
          ht_img(h:h+2,w:w+2)=t4;
      elseif img_gray(y,x) < 204
          ht_img(h:h+2,w:w+2)=t3;
      elseif img_gray(y,x) < 230
          ht_img(h:h+2,w:w+2)=t2;
      else 
          ht_img(h:h+2,w:w+2)= t1;
      end
    h = h + 3;
    end
    h=1;
    w = w + 3;
    
end