function detectpixel
global x y I1 I2
figure, imshow(I1);
[x,y] = ginput(1);
close
seg_tum;