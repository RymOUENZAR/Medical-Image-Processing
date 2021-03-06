function binar
global I1 binseuil borne1 borne2 a1
global binarisationautomatique seuilautos seuilauto 

binarisationautomatique=0;
% ***************************** FIGURE ********************************
figure('name','Binarisation','position',[450 150 600 350]...
            ,'color',[1 1 1],'menubar','none','resize','off');

% ************************** AFFICHER L'IMAGE *****************************        
subplot(122),imshow(I1)

title(a1,'color',[0 0 0],'Fontangle','Italic')

% *********************** SEUILLAGE AUTOMATIQUE ***************************
seuilauto=graythresh(I1)*255;
seuilautos=num2str(seuilauto);
% Bouton du seuillage automatique
uicontrol('position',[355 40 180 30],'string','binarisation automatique'...
    ,'fontsize',9,'callback','binarisationauto','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold');

% ************************** SEUILLAGE MANUEL *****************************
bin1=uipanel('units','pixels','position',[8 210 320 90],'backgroundcolor',[1 1 1]...
    ,'highlightcolor',[.63 .62 .63]);
% Texte
uicontrol('style','text','parent',bin1,'position',[5 25 140 35],'string','Entrez le seuil de binarisation :'...
    ,'fontsize',10,'fontangle','italic','backgroundcolor',[1 1 1]);
% Valeur
binseuil=uicontrol('style','edit','parent',bin1,'position',[140 31 70 20],'backgroundcolor',[1 1 1]...
    ,'string',seuilautos,'fontsize',10,'tooltipstring','entrez le seuil de binarisation');
% Bouton de visualisation
uicontrol('position',[230 27 80 30],'parent',bin1,'string','Visualiser',...
    'FontSize',8,'Fontangle','Italic','FontWeight','bold','callback','binarisationappliq');

% ***************** SEUILLAGE MANUEL ENTRE DEUX BORNES ********************
bin2=uipanel('units','pixels','position',[8 60 320 130],'backgroundcolor',[1 1 1]...
    ,'foregroundcolor',[1 0.8 0.2],'highlightcolor',[.63 .62 .63]);
%Texte
uicontrol('style','text','parent',bin2,'position',[8 70 300 40],'string','Entrez les deux bornes du seuil de binarisation :'...
    ,'fontsize',10,'fontangle','italic','backgroundcolor',[1 1 1]);
%Texte borne 1
uicontrol('style','text','parent',bin2,'position',[8 45 120 30],'backgroundcolor',[1 1 1]...
    ,'string','Premi�re borne :','fontsize',10,'fontangle','italic');
%Texte borne 2
uicontrol('style','text','parent',bin2,'position',[8 20 120 20],'backgroundcolor',[1 1 1]...
    ,'string','Deuxi�me borne :','fontsize',10,'fontangle','italic');
% Valeur 1
borne1=uicontrol('style','edit','parent',bin2,'position',[140 55 70 20],'backgroundcolor',[1 1 1]...
    ,'string','0','fontsize',10,'tooltipstring','entrez la premi�re borne');
% Valeur2
borne2=uicontrol('style','edit','parent',bin2,'position',[140 25 70 20],'backgroundcolor',[1 1 1]...
    ,'string','1','fontsize',10,'tooltipstring','entrez la deuxi�me borne');
% Bouton de visualisation
uicontrol('position',[230 35 80 30],'parent',bin2,'FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','string','Visualiser','callback','binarisationborne');  

% Bouton annuler
uicontrol('position',[200 20 80 30],'string','Annuler','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','close');
% Bouton ok        
uicontrol('position',[60 20 80 30],'string','OK','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','binarisationOK');
end