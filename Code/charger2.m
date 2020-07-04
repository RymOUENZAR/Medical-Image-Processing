% function [Y,map2]=charger2;
global I1 Ir
global f21 f22 f23
global f31 f32 f33
global f41 f42 f43 f44 f45 f46
global f51 f52 f53 f61 f62 f63 f64
global f71 f72
global invbut tailbut kI1 mI1 nI1 a1 mI2 nI2 kI2 a2 Texte0 Texte1 Texte2 Texte3 Texte4 Texte5
[a2,b2]= uigetfile({'*.jpg;*.tif;*.png;*.gif;*.bmp;'},path,'C:\Users\user\Documents\USTO\Master 2\SIVR\PFE\Nouveau dossier');
file=fullfile(b2,a2);
I2=imread(file);
[mI2 nI2 kI2]=size(I2);
mI2s=num2str(mI2);
nI2s=num2str(nI2);
LOGICIEL12
% set(Texte0,'visible','on');
% set([Texte1 Texte2 Texte3 Texte4 Texte5],'visible','off');
Ir=I2;
     [x,map]=imread('C:\Users\user\Documents\USTO\Master 2\SIVR\PFE\Nouveau dossier\a.png');
image(x), axis off,hold on
ax=axes('position',[0 0 1 1]);
imagesc(x);
axis off, hold on
% subplot(121)
axes('units','pixels','position',[15 80 300 250]);,imshow(I1); title(a1,'color',[0 0 0],'Fontangle','Italic')
xlabel(['(',mI1s,' x ',nI1s,')'],'FontSize',8,'Fontangle','Italic');
% subplot(122)
axes('units','pixels','position',[280 80 300 250]);,imshow(Ir); title(a2,'color',[0 0 0],'Fontangle','Italic')
xlabel(['(',mI2s,' x ',nI2s,')'],'FontSize',8,'Fontangle','Italic');
% Texte0=text(300,387,'Réalisé par : OUENZAR Rym Hakima - [USTO 2013]','Fontname','Arial','Fontsize',8,...
%          'Fontangle','Italic','color',[.33 .725 .84]);
    impixelinfo