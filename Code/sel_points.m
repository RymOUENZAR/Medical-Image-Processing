function sel_points
global im1 im2
% *********************** FIGURE ***************************
figure('name','Choix','position',[500 300 300 200],'resize','off'...
    ,'menubar','none','color',[1 1 1]);

% *********************** CHOIX ***************************
% Choix
choi=uibuttongroup('units','pixels','position',[45 70 200 100],'title','Choix de l''image Cible :'...
    ,'backgroundcolor',[1 1 1],'fontsize',10,...
    'highlightcolor',[.63 .63 .63],'fontangle','italic','fontweight','bold');
% Image 1
im1=uicontrol('style','radio','parent',choi,'position',[55 45 100 30]...
    ,'string','L''image 1','fontsize',10,...
    'backgroundcolor',[1 1 1]);
% Image 2
im2=uicontrol('style','radio','parent',choi,'position',[55 15 100 30]...
    ,'string','L''image 2','fontsize',10,...
    'backgroundcolor',[1 1 1]);

% *********************** BOUTONS ***************************
% Bouton annuler
uicontrol('position',[160 20 80 30],'string','Annuler','callback','close');
% Bouton ok
uicontrol('position',[60 20 80 30],'string','OK','callback','recalcp');