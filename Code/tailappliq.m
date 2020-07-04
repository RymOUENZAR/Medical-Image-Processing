function tailappliq
global I1 a1 rap mI2 nI2 I2 mI2s nI2s certifT1
rapport=str2double(get(rap,'string'));
if isnan(rapport)
      figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);

   uicontrol('style','text','position',[50 50 280 60],...
'string','Vous avez entré une valeur non-numérique'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);
uicontrol('position',[160 30 80 30],'string','OK','callback','close');

elseif rapport<=0
     figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);

   uicontrol('style','text','position',[50 50 280 60],...
'string','La valeur doit être supérieure à 0'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);
uicontrol('position',[160 30 80 30],'string','OK','callback','close');

else
I2=imresize(I1,rapport);
mI2=size(I2,1);
nI2=size(I2,2);
mI2s=num2str(mI2);
nI2s=num2str(nI2);
subplot(122), imshow(I2), title(a1,'color',[0 0 0],'Fontangle','Italic')
xlabel(['(',mI2s,' x ',nI2s,')'],'FontSize',8,'Fontangle','Italic');
end
certifT1=1;