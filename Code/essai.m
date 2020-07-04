function essai
global F I1 I2 Texte0 Texte1 Texte2 Texte3 Texte4 Texte5
close(F)
LOGICIEL12
set(Texte0,'visible','on');
set([Texte1 Texte2 Texte3 Texte4 Texte5],'visible','off');
axes('units','pixels','position',[20 50 350 300]);
imshow(I2);