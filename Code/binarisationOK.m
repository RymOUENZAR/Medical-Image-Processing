function binarisationOK
global I2 binarisationautomatique seuilauto binseuil travb a1 borne1 borne2 I1 Texte0 Texte1 Texte2 Texte3 Texte4 Texte5
close
LOGICIEL12
set(Texte0,'visible','on');
set([Texte1 Texte2 Texte3 Texte4 Texte5],'visible','off');
I1=I2;
axes('units','pixels','position',[20 50 350 300])
imshow(I1),title([a1,' binarisée'],'Fontangle','Italic');
    impixelinfo
end