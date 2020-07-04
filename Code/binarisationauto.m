function binarisationauto
global I1 I2 a1 %binarisationautomatique
I2=im2bw(I1);
axes('units','pixels','position',[20 65 350 300]); imshow(I2);
title(a1,'fontangle','italic');
%binarisationautomatique=1;