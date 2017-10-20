t1 = [000;000;000];
t2 = [010;000;000];
t3 = [010;000;001];
t4 = [110;000;001];
t5 = [110;000;101];
t6 = [111;000;101];
t7 = [111;001;101];
t8 = [111;001;111];
t9 = [111;101;111];
t10 = [111;111;111];
img = imread('cat.jpg');
img_gray = rgb2gray(img);
img_size = size(img_gray);
img_size_scaled = size(img_gray)*3;
ht_img = zeros(img_size_scaled(1,1),img_size_scaled(1,2));
for x=1:img_size(1,2)
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
%BW = mat2bw(ht_img);