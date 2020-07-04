function egali
global a1 I1 certifE2
certifE2=0;
% ***************************** FIGURE ********************************
figure('name','Egalisation de l''image','position',[400 250 600 350],'resize','off'...
    ,'menubar','none','color',[1 1 1]);

% ************************** AFFICHER L'IMAGE *****************************        
subplot(122),imshow(I1)

title(a1,'color',[0 0 0],'Fontangle','Italic')

% ************************** EGALISATION ******************************
% Titre
uicontrol('style','text','position',[65 200 200 30],'string','Egaliser l''image :'...
    ,'fontsize',10,'fontangle','italic','fontweight','bold','backgroundcolor',[1 1 1]);

% *********************** BOUTONS ***************************
% Bouton de visualisation
uicontrol('position',[120 150 80 30],'string','Visualiser','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','egaliser');
% Bouton annuler
uicontrol('position',[190 100 80 30],'string','Annuler','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','close');
% Bouton ok
uicontrol('position',[50 100 80 30],'string','OK','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','egalOK');