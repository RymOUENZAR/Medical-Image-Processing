function sauvegarder2
global filename I2
%img=getimage(I2);
[file,path]=uiputfile('.jpg','Sauvegarder image',['save\BIO-',filename]);
imwrite(I2,[path,file]);
clc