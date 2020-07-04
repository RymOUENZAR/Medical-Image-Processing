% function [X,map1]=charger1;
global I1 kI1 mI1 nI1 a1 Texte0 Texte1 Texte2 Texte3 Texte4 Texte5
% *********************** OUVRIR UNE IMAGE ***************************
[a1,b1]= uigetfile({'*.jpg;*.tif;*.png;*.gif;*.bmp;'},path,'C:\Users\user\Documents\USTO\Master 2\SIVR\PFE\Nouveau dossier');
file=fullfile(b1,a1);
I2=imread(file);
[mI1 nI1 kI1]=size(I2);
mI1s=num2str(mI1);
nI1s=num2str(nI1);
LOGICIEL12
% *********************** AFFICHAGE ***************************
% set(Texte0,'visible','on');
% set([Texte1 Texte2 Texte3 Texte4 Texte5],'visible','off');
I1=I2;
  axes('units','pixels','position',[20 50 350 300]);
imshow(I1);
title(a1,'color',[0 0 0],'Fontangle','Italic')
xlabel(['(',mI1s,' x ',nI1s,')'],'FontSize',8,'Fontangle','Italic');

    impixelinfo
%     Texte0=text(300,470,'Réalisé par : OUENZAR Rym Hakima - [USTO 2013]','Fontname','Arial','Fontsize',8,...
%          'Fontangle','Italic','color',[.33 .725 .84]);