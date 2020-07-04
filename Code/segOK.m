function segOK
global I2 u2 I1 F im1 im2 a1 Texte0 Texte1 Texte2 Texte3 Texte4 Texte5

if (get(im1,'value'))==(get(im1,'max'))
    close
    LOGICIEL12
    set(Texte0,'visible','on');
    set([Texte1 Texte2 Texte3 Texte4 Texte5],'visible','off');
    I1=I2;
    set (F,'visible','on');
    axes('units','pixels','position',[20 50 350 300]), imshow(I1),title([a1,' filtrée']...
        ,'color',[0 0 0],'Fontangle','Italic');
    impixelinfo
else
    close
    LOGICIEL12
    set(Texte0,'visible','on');
    set([Texte1 Texte2 Texte3 Texte4 Texte5],'visible','off');
    I1=u2;
    set (F,'visible','on');
    axes('units','pixels','position',[20 50 350 300]), imshow(I1),title([a1,' filtrée']...
        ,'color',[0 0 0],'Fontangle','Italic');
    impixelinfo
end

