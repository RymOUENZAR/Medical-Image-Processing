function normalisation
global a1 I1 certifN2
certifN2=0;
% ***************************** FIGURE ********************************
figure('name','Normalisation de l''image','position',[400 250 600 350],'resize','off'...
    ,'menubar','none','color',[1 1 1]);

     [x,map]=imread('C:\Users\user\Documents\USTO\Master 2\SIVR\PFE\Nouveau dossier\a.png');
image(x), axis off,hold on
ax=axes('position',[0 0 1 1]);
imagesc(x);
axis off

% ************************** AFFICHER L'IMAGE *****************************        
subplot(122),imshow(I1)
% axes('units','pixels','position',[320 80 250 200])

title(a1,'color',[0 0 0],'Fontangle','Italic')

% ************************** NORMALISATION ******************************
% Titre
uicontrol('style','text','position',[65 200 200 30],'string','Normaliser l''image :'...
    ,'fontsize',10,'fontangle','italic','fontweight','bold','backgroundcolor',[1 1 1]);

% text(-620,150,'Normaliser l''image','Fontname','Arial','Fontsize',10,...
%          'Fontangle','Italic','Fontweight','bold');

% *********************** BOUTONS ***************************
% Bouton de visualisation
uicontrol('position',[120 150 80 30],'string','Visualiser','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','normaliser');
% Bouton annuler
uicontrol('position',[190 100 80 30],'string','Annuler','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','close');
% Bouton ok
uicontrol('position',[50 100 80 30],'string','OK','FontSize',8,'Fontangle','Italic',...
    'FontWeight','bold','callback','normalOK');
