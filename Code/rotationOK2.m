function rotationOK2
global imrot2 I1 a1 travb Texte0Texte1 Texte2 Texte3 Texte4 Texte5
close
LOGICIEL12
set(Texte0,'visible','on');
set([Texte1 Texte2 Texte3 Texte4 Texte5],'visible','off');
I1=imrot2;
axes('units','pixels','position',[20 50 350 300])
imshow(I1),title(a1,'Fontangle','Italic');
    impixelinfo