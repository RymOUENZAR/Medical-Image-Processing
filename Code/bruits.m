function bruits
global I1 a1 para1 para2 parat1 parat2 popbruit brtapp brtcertif
% IF image binaire --> IMPOSSIBLE
% ***************************** FIGURE ********************************
figure('name','Bruitage de l''image','position',[400 250 600 350]...
            ,'color',[1 1 1],'menubar','none','resize','on');

% ************************** AFFICHER L'IMAGE *****************************        
subplot(122),imshow(I1)

title(a1,'color',[0 0 0],'Fontangle','Italic')

% ************************** Bruitage ******************************
% Choix
popbruit=uicontrol('style','popup','position',[110 245 100 30],'string'...
    ,'Gaussien|Poisson|Sel & Poivre|Tavelure'...
    ,'backgroundcolor',[1 1 1],'fontsize',10,'callback','bruitpop');
% Valeur 1
para1=uicontrol('style','edit','position',[190 200 70 20],'backgroundcolor',[1 1 1],...
    'fontsize',10,'tooltipstring','Entrez la moyenne','string','0');
% Valeur 2
para2=uicontrol('style','edit','position',[190 150 70 20],'backgroundcolor',[1 1 1],...
    'fontsize',10,'tooltipstring','Entrez la variance','string','1');
% Paramètre 1
parat1=uicontrol('style','text','position',[15 190 140 30],'string','Entrez la moyenne :'...
    ,'fontsize',10,'backgroundcolor',[1 1 1],'horizontalalignment','right');
% Paramètre 2
parat2=uicontrol('style','text','position',[15 140 140 30],'string','Entrez la variance :'...
    ,'fontsize',10,'backgroundcolor',[1 1 1],'horizontalalignment','right');

% *********************** BOUTONS ***************************
% Bouton de visualisation
brtapp=uicontrol('position',[120 100 80 30],'string','Visualiser','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','bruitappliq');
% Bouton annuler
uicontrol('position',[190 50 80 30],'string','Annuler','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','close');
% Bouton ok
uicontrol('position',[50 50 80 30],'string','OK','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','bruitOK');
% Bouton afficher l'image originale
uicontrol('position',[370 40 150 30],'string','Afficher l''image originale','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','affich');

brtcertif=0;