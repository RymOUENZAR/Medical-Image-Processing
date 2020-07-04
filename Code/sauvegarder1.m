function sauvegarder1
global filename;
img=getimage(I1);
[file,path]=uiputfile('.jpg','Sauvegarder image',['save\BIO-',filename]);
imwrite(img,[path,file]);
clc