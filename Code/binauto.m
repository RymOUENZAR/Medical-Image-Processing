function binauto
global I1 a1
global binarisationautomatique

binarisationautomatique=0;
% ***************************** FIGURE ********************************
figure('name','Binarisation','position',[450 150 400 400]...
            ,'color',[1 1 1],'menubar','none','resize','off');

% ************************** AFFICHER L'IMAGE *****************************         
axes('units','pixels','position',[20 65 350 300]); imshow(I1);
title(a1,'fontangle','italic');

% ****************************** BOUTONS *********************************
% Bouton de visualisation
uicontrol('position',[45 20 80 30],'string','Visualiser','callback','binarisationauto',...
    'fontangle','italic','fontweight','bold','fontsize',8);
% Bouton ok
uicontrol('position',[155 20 80 30],'string','OK','callback','binarisationOK',...
    'fontangle','italic','fontweight','bold','fontsize',8);
% Bouton annuler
uicontrol('position',[265 20 80 30],'string','Annuler','callback','close',...
    'fontangle','italic','fontweight','bold','fontsize',8);