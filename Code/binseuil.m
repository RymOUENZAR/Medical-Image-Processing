function binseuil
global I1 binseuil a1
global binarisationautomatique seuilautos seuilauto 

binarisationautomatique=0;

% ***************************** FIGURE ********************************
figure('name','Binarisation','position',[450 150 600 350]...
            ,'color',[1 1 1],'menubar','none','resize','off');

% ************************** AFFICHER L'IMAGE *****************************        
subplot(122),imshow(I1)

title(a1,'color',[0 0 0],'Fontangle','Italic')

% ************************** SEUILLAGE MANUEL *****************************
seuilauto=graythresh(I1)*255;
seuilautos=num2str(seuilauto);
% Titre
uicontrol('style','text','position',[65 245 200 30],'string','Binariser :'...
    ,'fontsize',10,'fontangle','italic','fontweight','bold','backgroundcolor',[1 1 1]);
% Texte
uicontrol('style','text','position',[65 190 200 30],'string','Seuil :'...
    ,'fontsize',10,'fontangle','italic','backgroundcolor',[1 1 1]);
% Valeur
binseuil=uicontrol('style','edit','position',[125 160 70 20],'backgroundcolor',[1 1 1]...
    ,'string',seuilautos,'fontsize',10,'tooltipstring','Seuil');

% *********************** BOUTONS ***************************
% Bouton de visualisation
uicontrol('position',[120 100 80 30],'string','Visualiser','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','binarisationappliq');
% Bouton annuler
uicontrol('position',[190 50 80 30],'string','Annuler','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','close');
% Bouton ok
uicontrol('position',[50 50 80 30],'string','OK','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','binarisationOK');