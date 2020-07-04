function taillerap
global mI1s nI1s a1 rap certifT2 I1
certifT2=0;
close
% *********************** FIGURE ***************************
figure('name','Redimensionner','position',[400 250 600 350],'resize','off'...
    ,'menubar','none','color',[1 1 1]);

% *********************** AFFICHER L'IMAGE ***************************
subplot(122), imshow(I1); title(a1,'color',[0 0 0],'Fontangle','Italic')
xlabel(['(',mI1s,' x ',nI1s,')'],'FontSize',8,'Fontangle','Italic');

% *********************** REDIMENSIONNEMENT ***************************
% Titre
uicontrol('style','text','position',[65 245 200 30],'string','Redimensionner :'...
    ,'fontsize',10,'fontangle','italic','fontweight','bold','backgroundcolor',[1 1 1]);
% Texte
uicontrol('style','text','position',[65 190 200 30],'string','Facteur d''échelle :'...
    ,'fontsize',10,'fontangle','italic','backgroundcolor',[1 1 1]);
% Valeur
rap=uicontrol('style','edit','position',[125 160 70 20],'backgroundcolor',[1 1 1]...
    ,'string','1','fontsize',10,'tooltipstring','Facteur d''échelle','max',1);

% *********************** BOUTONS ***************************
% Bouton de visualisation
uicontrol('position',[120 100 80 30],'string','Visualiser','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','tailappliq');
% Bouton annuler
uicontrol('position',[190 50 80 30],'string','Annuler','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','close');
% Bouton ok
uicontrol('position',[50 50 80 30],'string','OK','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','tailok');
