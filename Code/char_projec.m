function char_projec
global input_points base_points I1 Ir i1 i2 Ir_registered I
load recale_points

t_concord = cp2tform(input_points,base_points,'projective');
mrec=size(i2,1);
nrec=size(i2,2);
Ir_registered = imtransform(i1, t_concord,...
                                'XData',[1 mrec],...
                                'YData',[1 nrec]);
% figure, imshow(Ir_registered)

 longueur=600;
 hauteur=394;
 pos=[180 130 longueur hauteur];
 F=figure('name','Recalage','position',pos,'menubar','none'...
         ,'color',[1 1 1],'resize','off');
     
     
axes('units','pixels','position',[5 50 300 250]), imshow(Ir_registered),
title('Image recalée','fontangle','italic');
I=i2+Ir_registered;
axes('units','pixels','position',[300 50 300 250]), imshow(I),
title('Superposition des deux images','fontangle','italic');

uicontrol('position',[345 340 80 30],'string','Annuler','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','close');

uicontrol('position',[180 340 80 30],'string','OK','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','recalOK1');