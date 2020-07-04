function taillelar
global a1 mI1s nI1s hau lar certifT1 I1
certifT1=0;
close
% *********************** FIGURE ***************************
figure('name','Redimensionner','position',[400 250 600 350],'resize','off'...
    ,'menubar','none','color',[1 1 1]);

% *********************** AFFICHER L'IMAGE ***************************
subplot(122), imshow(I1); title(a1,'color',[0 0 0],'Fontangle','Italic')
xlabel(['(',mI1s,' x ',nI1s,')'],'FontSize',8,'Fontangle','Italic');

% *********************** REDIMENSIONNEMENT ***************************
uicontrol('style','text','position',[65 250 200 30],'string','Redimensionner :'...
    ,'fontsize',10,'fontangle','italic','fontweight','bold','backgroundcolor',[1 1 1]);
% Texte 1
uicontrol('style','text','position',[50 190 100 30],'string','La hauteur :'...
    ,'fontsize',10,'fontsize',10,'fontangle','italic','backgroundcolor',[1 1 1]);
% Valeur 1
hau=uicontrol('style','edit','position',[160 200 70 20],'backgroundcolor',[1 1 1]...
    ,'string',mI1s,'fontsize',10,'tooltipstring','Hauteur','max',1);
% Texte 2
uicontrol('style','text','position',[50 140 100 30],'string','La largeur :'...
    ,'fontsize',10,'fontangle','italic','backgroundcolor',[1 1 1]);
% Valeur 2
lar=uicontrol('style','edit','position',[160 150 70 20],'backgroundcolor',[1 1 1],...
    'string',nI1s,'fontsize',10,'tooltipstring','Largeur','max',1);

% *********************** BOUTONS ***************************
% Bouton de visualisation
uicontrol('position',[120 100 80 30],'string','Visualiser','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','tailappliq2');
% Bouton annuler
uicontrol('position',[190 50 80 30],'string','Annuler','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','close');
% Bouton ok
uicontrol('position',[50 50 80 30],'string','OK','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','tailok2');
