function translOK2
global I1 I2 translatcert2 travb a1 F Texte0 Texte1 Texte2 Texte3 Texte4 Texte5
if (translatcert2==0) 
     figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);
   uicontrol('style','text','position',[150 50 300 80],...
'string','Aucune modification effectuée'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);

uicontrol('position',[160 30 80 30],'string','OK','callback','close');
else 
    close
    LOGICIEL12
    set(Texte0,'visible','on');
set([Texte1 Texte2 Texte3 Texte4 Texte5],'visible','off');
    I1=I2;
set (F,'visible','on');
axes('units','pixels','position',[20 50 350 300])
imshow(I1),title([a1,' translatée'],'Fontangle','Italic');
    impixelinfo
end
