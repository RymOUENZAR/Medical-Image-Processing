function translation2
global I1 translatcert2 a1 tx12 ty12
translatcert2=0;
% ***************************** FIGURE ********************************
figure('name','Translation','position',[450 150 400 500]...
            ,'color',[1 1 1],'menubar','none','resize','off');

% ***************************** AFFICHER L'IMAGE ********************************
axes('units','pixels','position',[90 50 250 200]); imshow(I1)

title(a1,'color',[0 0 0],'Fontangle','Italic')

% ***************************** TRANSLATION ********************************
trans1=uipanel('units','pixels','position',[20 350 362 124],'backgroundcolor',[1 1 1]...
    ,'foregroundcolor',[1 0.8 0.2],'highlightcolor',[.63 .63 .63]);
% Texte 1
uicontrol('style','text','parent',trans1,'position',[15 70 200 20],'string','Translation par rapport � X :'...
    ,'fontsize',10,'Fontangle','Italic','backgroundcolor',[1 1 1]);
% Valeur 1
tx12=uicontrol('style','edit','parent',trans1,'position',[250 73 70 20],'backgroundcolor',[1 1 1]...
    ,'string','0','fontsize',10,'tooltipstring','Translation par rapport � X');
% Texte 2
uicontrol('style','text','parent',trans1,'position',[15 25 200 20],'backgroundcolor',[1 1 1]...
    ,'string','Translation par rapport � Y :','fontsize',10,'Fontangle','Italic');
% Valeur 2
ty12=uicontrol('style','edit','parent',trans1,'position',[250 28 70 20],'backgroundcolor',[1 1 1]...
    ,'string','0','fontsize',10,'tooltipstring','Entrez la coordonn�e verticale');

% ***************************** BOUTONS ********************************
% Bouton de visualisation
uicontrol('position',[40 300 80 30],'FontSize',8,'Fontangle','Italic','FontWeight','bold'...
        ,'string','Visualiser','callback','transappliq2'); 
% Bouton ok    
uicontrol('position',[170 300 80 30],'FontSize',8,'Fontangle','Italic','FontWeight','bold'...
        ,'string','OK','callback','translOK2');
% Bouton annuler
uicontrol('position',[290 300 80 30],'FontSize',8,'Fontangle','Italic','FontWeight','bold'...
            ,'string','Annuler','callback','close');