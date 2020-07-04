function sauvegarder
global filename;
img=getimage(figure(1));
[file,path]=uiputfile('.jpg','Sauvegarder image',['save\BIO-',filename]);
imwrite(img,[path,file]);
clc