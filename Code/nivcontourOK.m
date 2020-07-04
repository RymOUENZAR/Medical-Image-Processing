function nivcontourOK
global I1 I2 F a1 niv Texte0 Texte1 Texte2 Texte3 Texte4 Texte5 nivcont
niv=str2double(get(nivcont,'string'));
close
LOGICIEL12
I1=I2;
set(Texte0,'visible','on');
set([Texte1 Texte2 Texte3 Texte4 Texte5],'visible','off');
set (F,'visible','on');
axes('units','pixels','position',[20 50 350 300]), imcontour(I1,niv),title([a1,' en niveaux de contours']...
    ,'color',[0 0 0],'Fontangle','Italic');
axis off