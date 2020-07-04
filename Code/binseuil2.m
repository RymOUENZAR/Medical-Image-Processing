function binseuil2
global I1 borne1 borne2 a1
global binarisationautomatique

binarisationautomatique=0;

% ***************************** FIGURE ********************************
figure('name','Binarisation','position',[450 150 600 350]...
            ,'color',[1 1 1],'menubar','none','resize','off');

% ************************** AFFICHER L'IMAGE *****************************        
subplot(122),imshow(I1)

title(a1,'color',[0 0 0],'Fontangle','Italic')

% ************************** SEUILLAGE MANUEL *****************************
% Titre
uicontrol('style','text','position',[65 250 200 30],'string','Binariser :'...
    ,'fontsize',10,'fontangle','italic','fontweight','bold','backgroundcolor',[1 1 1]);
% Texte 1
uicontrol('style','text','position',[50 190 100 30],'string','Seuil 1 :'...
    ,'fontsize',10,'fontsize',10,'fontangle','italic','backgroundcolor',[1 1 1]);
% Valeur 1
borne1=uicontrol('style','edit','position',[160 200 70 20],'backgroundcolor',[1 1 1]...
    ,'string','0','fontsize',10,'tooltipstring','Seuil1');
% Texte 2
uicontrol('style','text','position',[50 140 100 30],'string','Seuil 2 :'...
    ,'fontsize',10,'fontangle','italic','backgroundcolor',[1 1 1]);
% Valeur 2
borne2=uicontrol('style','edit','position',[160 150 70 20],'backgroundcolor',[1 1 1],...
    'string','255','fontsize',10,'tooltipstring','Seuil2');

% *********************** BOUTONS ***************************
% Bouton de visualisation
uicontrol('position',[120 100 80 30],'string','Visualiser','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','binarisationborne');
% Bouton annuler
uicontrol('position',[190 50 80 30],'string','Annuler','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','close');
% Bouton ok
uicontrol('position',[50 50 80 30],'string','OK','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','binarisationOK');
