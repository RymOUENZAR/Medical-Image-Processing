function segcontrolauto
global mresiz nresiz alfaset niteration I1 a1
%IF image binaire --> IMPOSSIBLE
% *********************** FIGURE ***************************
figure('name','Segmentation de l''objet','position',[400 250 600 350],'resize','off'...
    ,'menubar','none','color',[1 1 1]);

% *********************** AFFICHER L'IMAGE ***************************
subplot(122), imshow(I1); title(a1,'color',[0 0 0],'Fontangle','Italic')

% *********************** CHANGEMENT DE TAILLE ***************************
%Titre 1
seg1=uipanel('units','pixels','position',[50 210 240 100],'backgroundcolor',[1 1 1]...
    ,'highlightcolor',[.63 .63 .63],'title','Taille de l''image :'...
   ,'fontsize',10,'fontangle','italic','fontweight','bold');
% Lignes
uicontrol('style','text','parent',seg1,'position',[20 47 70 25],'string','Lignes :'...
    ,'fontsize',10,'backgroundcolor',[1 1 1],'horizontalalignment','right','fontangle','italic');
% Valeur 1
mresiz=uicontrol('style','edit','parent',seg1,'position',[170 52 50 20],'backgroundcolor',[1 1 1]...
    ,'string','200');
% Colonnes
uicontrol('style','text','parent',seg1,'position',[20 7 70 25],'string','Colonnes :'...
    ,'fontsize',10,'backgroundcolor',[1 1 1],'horizontalalignment','right','fontangle','italic');
% Valeur 2
nresiz=uicontrol('style','edit','parent',seg1,'position',[170 12 50 20],'backgroundcolor',[1 1 1]...
    ,'string','200');
% Titre 2
seg2=uipanel('units','pixels','position',[50 100 240 100],'backgroundcolor',[1 1 1]...
    ,'highlightcolor',[.63 .63 .63],'title','Paramètres :'...
   ,'fontsize',10,'fontangle','italic','fontweight','bold');
% Itérations
uicontrol('style','text','parent',seg2,'position',[20 47 130 25],'string','Nombre d''itérations :'...
    ,'fontsize',10,'backgroundcolor',[1 1 1],'horizontalalignment','right','fontangle','italic');
% Valeur 3
niteration=uicontrol('style','edit','parent',seg2,'position',[170 52 50 20],'backgroundcolor',[1 1 1]...
    ,'string','300');
% Alfa
uicontrol('style','text','parent',seg2,'position',[20 7 70 25],'string','Alpha :'...
    ,'fontsize',10,'backgroundcolor',[1 1 1],'horizontalalignment','right','fontangle','italic');
% Valeur 4
alfaset=uicontrol('style','edit','parent',seg2,'position',[170 12 50 20],'backgroundcolor',[1 1 1]...
    ,'string','1.5');

% *********************** BOUTONS ***************************
% Bouton de visualisation
uicontrol('position',[130 55 80 30],'string','Visualiser','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','seglevelauto');
% Bouton annuler
uicontrol('position',[180 20 80 30],'string','Annuler','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','close');
% Bouton ok
uicontrol('position',[80 20 80 30],'string','OK','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','segmautoOK');