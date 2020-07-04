function contrast
global a1 I1 a certifC2
certifC2=0;
% ***************************** FIGURE ********************************
figure('name','Amélioration du contraste','position',[400 250 600 350],'resize','off'...
    ,'menubar','none','color',[1 1 1]);

% ************************** AFFICHER L'IMAGE *****************************        
subplot(122),imshow(I1)

title(a1,'color',[0 0 0],'Fontangle','Italic')

% *********************** AMELIORATION DU CONTRASTE ***************************
% Titre
uicontrol('style','text','position',[65 245 200 30],'string','Améliorer le contraste :'...
    ,'fontsize',10,'fontangle','italic','fontweight','bold','backgroundcolor',[1 1 1]);
% Texte
uicontrol('style','text','position',[65 190 200 30],'string','Facteur de contraste :'...
    ,'fontsize',10,'fontangle','italic','backgroundcolor',[1 1 1]);
% Valeur
a=uicontrol('style','edit','position',[125 160 70 20],'backgroundcolor',[1 1 1]...
    ,'string','1','fontsize',10,'tooltipstring','Facteur de contraste','max',1);

% *********************** BOUTONS ***************************
% Bouton de visualisation
uicontrol('position',[120 100 80 30],'string','Visualiser','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','contrast1');
% Bouton annuler
uicontrol('position',[190 50 80 30],'string','Annuler','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','close');
% Bouton ok
uicontrol('position',[50 50 80 30],'string','OK','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','controk1');
% Bouton précédent
uicontrol('position',[390 40 100 30],'string','Image Originale','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','close,contrast');
