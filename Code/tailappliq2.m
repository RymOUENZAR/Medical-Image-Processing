function tailappliq2
global I1 mI2s nI2s mI2s nI2s hau lar a1 I2 certifT2
thau=str2double(get(hau,'string'));
tlar=str2double(get(lar,'string'));
if isnan(thau) || isnan (tlar)
     figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);

   uicontrol('style','text','position',[50 50 280 60],...
'string','Vous avez entré une valeur non-numérique'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);
uicontrol('position',[160 30 80 30],'string','OK','callback','close');

elseif thau<=0 || tlar<=0
     figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);

   uicontrol('style','text','position',[50 50 280 60],...
'string','Les valeurs doivent être supérieures à 0'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);
uicontrol('position',[160 30 80 30],'string','OK','callback','close');

else
I2=imresize(I1,[thau tlar]);
mI2=size(I2,1);
nI2=size(I2,2);
mI2s=num2str(mI2);
nI2s=num2str(nI2);
subplot(122), imshow(I2), title(a1,'color',[0 0 0],'Fontangle','Italic')
xlabel(['(',mI2s,' x ',nI2s,')'],'FontSize',8,'Fontangle','Italic');
end
certifT2=1;