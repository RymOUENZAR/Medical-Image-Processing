function recalOK1
global Ir Ir_registered F a2 Texte0 Texte1 Texte2 Texte3 Texte4 Texte5
close
    LOGICIEL12
    set(Texte0,'visible','on');
    set([Texte1 Texte2 Texte3 Texte4 Texte5],'visible','off');
    Ir=Ir_registered;
    set (F,'visible','on');
    subplot(122), imshow(Ir),title([a2,' recalée']...
        ,'color',[0 0 0],'Fontangle','Italic');
    impixelinfo