function color2gray
global I1 a1
% *********************** FIGURE ***************************
figure('name','Conversion en niveaux de gris','position',[450 150 400 400]...
            ,'color',[1 1 1],'menubar','none','resize','off');
        
% *********************** AFFICHAGE ***************************        
axes('units','pixels','position',[20 65 350 300]); imshow(I1);

title(a1,'color',[0 0 0],'Fontangle','Italic')

% *********************** BOUTONS ***************************
% Bouton de visualisation
uicontrol('position',[45 20 80 30],'string','Visualiser','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','color2grayappliq');
% Bouton ok
uicontrol('position',[155 20 80 30],'string','OK','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','color2grayOK');
% Bouton annuler
uicontrol('position',[265 20 80 30],'string','Annuler','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','close');