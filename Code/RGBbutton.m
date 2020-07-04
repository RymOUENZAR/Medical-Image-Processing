function RGBbutton
global I1 filename ext mI1s nI1s f28 RGBm binm indexm grism incom binaireb RGBb grisb indexedb %img1 precedentbutton
global I2 travb F
I2=rgb2gray(I1);
%flagdetect
                
set(F,'visible','on');
axes('units','pixels','position',[600 50 350 300]),imshow(I2),title('Niveaux de gris');
    xlabel(['taille :(',mI1s,' x ',nI1s,')']...
                    ,'fontsize',10,'color',[0 0 0]);

%precedon
impixelinfo


