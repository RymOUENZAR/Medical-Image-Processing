function nivcontourappliq
global F I2 nivcont nivcont text kI1 mI1 nI1 I1 f_n mI1s nI1s a1

niv=str2double(get(nivcont,'string'));
if niv>50
     figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);

   uicontrol('style','text','position',[50 50 280 60],...
'string','Le calcul sera trop long ...'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);
uicontrol('position',[160 30 80 30],'string','OK','callback','close');

elseif isnan(niv)
     figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);

   uicontrol('style','text','position',[50 50 280 60],...
'string','Vous avez entré une valeur non-numérique'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);
uicontrol('position',[160 30 80 30],'string','OK','callback','close');

elseif niv<1
     figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);

   uicontrol('style','text','position',[50 50 280 60],...
'string','La valeur doit être supérieure à 0'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);
uicontrol('position',[160 30 80 30],'string','OK','callback','close');

else
imggray0

h = waitbar(0,'Calcul en cours...');
hw=findobj(h,'Type','Patch');
set(hw,'EdgeColor',[0 0 0],'FaceColor',[.33 .725 .84]) % changes the color to green
for i=1:(length(I1)*niv)
    waitbar(i/(length(I1)*niv))
end
close(h) 

subplot(122),imcontour(I2,niv);
title('Niveaux de contours','Fontangle','Italic');
% xlabel(['(',mI1s,' x ',nI1s,')'],'FontSize',8,'Fontangle','Italic');
axis off
% set (F,'visible','on');
% axes('units','pixels','position',[20 50 350 300]), imcontour(I2,niv),title([a1,' en niveaux de contours']...
%     ,'color',[0 0 0],'Fontangle','Italic');
% axis off
% close(f_n)
end

