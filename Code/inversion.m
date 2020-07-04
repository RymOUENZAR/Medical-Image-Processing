function inversion
global I1 a1
% ***************************** FIGURE ********************************
figure('name','Inversion de l''image','position',[450 150 400 400]...
            ,'color',[1 1 1],'menubar','none','resize','off');
        
% ************************** AFFICHER L'IMAGE *****************************         
axes('units','pixels','position',[20 65 350 300]); imshow(I1);
title(a1,'fontangle','italic');

% ****************************** BOUTONS *********************************
% Bouton de visualisation
uicontrol('position',[45 20 80 30],'string','Visualiser','callback','inversionappliq',...
    'fontangle','italic','fontweight','bold','fontsize',8);
% Bouton ok
uicontrol('position',[155 20 80 30],'string','OK','callback','inversionOK',...
    'fontangle','italic','fontweight','bold','fontsize',8);
% Bouton annuler
uicontrol('position',[265 20 80 30],'string','Annuler','callback','close',...
    'fontangle','italic','fontweight','bold','fontsize',8);