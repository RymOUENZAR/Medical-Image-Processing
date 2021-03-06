function segtumauto
global mresiz nresiz alfaset niteration I1 a1 sigmaset
%IF image binaire --> IMPOSSSIBLE
close
figure('name','Segmentation de la tumeur','position',[400 250 500 300],'resize','off'...
    ,'menubar','none','color',[1 1 1]);

% uicontrol('style','text','position',[290 250 150 20],'string',['* ',a1,' *']...
%     ,'backgroundcolor',[1 1 1],'fontsize',12);

subplot(122),imshow(I1)

uipanel('units','pixels','position',[10 190 240 100],'backgroundcolor',[1 1 1]...
    ,'highlightcolor',[.63 .63 .63],'title','Taille de l''image :'...
   ,'fontsize',10);

uicontrol('style','text','position',[20 230 70 25],'string','Lignes :'...
    ,'fontsize',10,'backgroundcolor',[1 1 1],'horizontalalignment','right');

mresiz=uicontrol('style','edit','position',[150 235 50 20],'backgroundcolor',[1 1 1]...
    ,'string','200');

uicontrol('style','text','position',[20 200 70 25],'string','Colonnes :'...
    ,'fontsize',10,'backgroundcolor',[1 1 1],'horizontalalignment','right');

nresiz=uicontrol('style','edit','position',[150 205 50 20],'backgroundcolor',[1 1 1]...
    ,'string','200');

f=uipanel('units','pixels','position',[10 80 240 100],'backgroundcolor',[1 1 1]...
    ,'highlightcolor',[.63 .63 .63],'title','Paramètres :'...
   ,'fontsize',10);

uicontrol('style','text','parent',f,'position',[5 52 130 25],'string','Nombre d''itérations :'...
    ,'fontsize',10,'backgroundcolor',[1 1 1],'horizontalalignment','right');

niteration=uicontrol('style','edit','position',[170 140 50 20],'backgroundcolor',[1 1 1]...
    ,'string','300');

uicontrol('style','text','parent',f,'position',[5 28 100 25],'string','Alpha :'...
    ,'fontsize',10,'backgroundcolor',[1 1 1],'horizontalalignment','right');

alfaset=uicontrol('style','edit','position',[170 117 50 20],'backgroundcolor',[1 1 1]...
    ,'string','-1.5');

uicontrol('style','text','parent',f,'position',[5 7 100 25],'string','Sigma :'...
    ,'fontsize',10,'backgroundcolor',[1 1 1],'horizontalalignment','right');

sigmaset=uicontrol('style','edit','position',[170 95 50 20],'backgroundcolor',[1 1 1]...
    ,'string','1.5');

uicontrol('position',[100 45 80 30],'string','Visualiser','callback','detectpixel');

uicontrol('position',[150 10 80 30],'string','Annuler','callback','close');

uicontrol('position',[50 10 80 30],'string','OK','callback','segmautoOK');