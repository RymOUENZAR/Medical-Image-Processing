function segtum
global I1 Cx Cy niteration alfaset sigmaset mI1 nI1 a1
position=[400 250 600 350];

Cx=mI1/2; Cy=nI1/2; niteration=200;
Cx=round(Cx); Cy=round(Cy);
% *********************** FIGURE ***************************
figure('name','Segmenter la tumeur','position',position,'menubar','none'...
         ,'color',[1 1 1],'resize','off');
     
uipanel('units','pixels'...      %Image
                 ,'position',[20 80 350 300]...
                 ,'backgroundcolor',[1 1 1],'bordertype','none');
             
% panel2=uipanel('units','pixels'...      %Information sur les Pixels
%                  ,'position',[380 279 300 100]...
%                  ,'backgroundcolor',[1 1 1],'bordertype','none');
             
uipanel('units','pixels'...      %Charger et lancer
                 ,'position',[380 80 300 180]...
                 ,'backgroundcolor',[1 1 1],'bordertype','none');
             
% *********************** AFFICHER L'IMAGE + INFO PIXELS ***************************
subplot(122), imshow(I1); title(a1,'color',[0 0 0],'Fontangle','Italic')

hp = impixelinfo;
set(hp,'Position',[360 50 200 20]);

% *********************** COORDONEES PIXEL ***************************
% Titre
seg01=uipanel('units','pixels','position',[50 210 240 100],'backgroundcolor',[1 1 1]...
    ,'highlightcolor',[.63 .63 .63],'title','Coordonnées du Pixel :'...
   ,'fontsize',10,'fontangle','italic','fontweight','bold');
% Texte 1
uicontrol('style','text','parent',seg01,'position',[20 47 100 25],'string','Coordonnée X :'...
    ,'fontsize',10,'backgroundcolor',[1 1 1],'horizontalalignment','right','fontangle','italic');
% Valeur 1
Cx=uicontrol('style','edit','parent',seg01,'position',[170 52 50 20],'backgroundcolor',[1 1 1]...
    ,'string',Cx);
% Texte 2
uicontrol('style','text','parent',seg01,'position',[20 7 100 25],'string','Coordonnée Y :'...
    ,'fontsize',10,'backgroundcolor',[1 1 1],'horizontalalignment','right','fontangle','italic');
% Valeur 2
Cy=uicontrol('style','edit','parent',seg01,'position',[170 12 50 20],'backgroundcolor',[1 1 1]...
    ,'string',Cy);
% Paramètres
seg02=uipanel('units','pixels','position',[50 100 240 100],'backgroundcolor',[1 1 1]...
    ,'highlightcolor',[.63 .63 .63],'title','Paramètres :'...
   ,'fontsize',10,'fontangle','italic','fontweight','bold');
% Texte 3
uicontrol('style','text','parent',seg02,'position',[5 52 130 25],'string','Nombre d''itérations :'...
    ,'fontsize',10,'backgroundcolor',[1 1 1],'horizontalalignment','right','fontangle','italic');
% Valeur 3
niteration=uicontrol('style','edit','parent',seg02,'position',[170 57 50 20],'backgroundcolor',[1 1 1]...
    ,'string',niteration);
% Texte 4
uicontrol('style','text','parent',seg02,'position',[5 28 100 25],'string','Alpha :'...
    ,'fontsize',10,'backgroundcolor',[1 1 1],'horizontalalignment','right','fontangle','italic');
% Valeur 4
alfaset=uicontrol('style','edit','parent',seg02,'position',[170 33 50 20],'backgroundcolor',[1 1 1]...
    ,'string','-3');
% Texte 5
uicontrol('style','text','parent',seg02,'position',[5 6 100 25],'string','Sigma :'...
    ,'fontsize',10,'backgroundcolor',[1 1 1],'horizontalalignment','right','fontangle','italic');
% Valeur 5
sigmaset=uicontrol('style','edit','parent',seg02,'position',[170 10 50 20],'backgroundcolor',[1 1 1]...
    ,'string','4.2');

% *********************** BOUTONS ***************************
% Bouton de visualisation
uicontrol('position',[130 55 80 30],'string','Visualiser','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','levelset2');
% Bouton annuler
uicontrol('position',[180 20 80 30],'string','Annuler','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','close');
% Bouton ok
uicontrol('position',[80 20 80 30],'string','OK','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','segmautoOK');
