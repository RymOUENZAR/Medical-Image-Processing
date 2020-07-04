function op3dcoupes_a
load mri
op1=figure('menubar','none','resize','off','color',[.5 .5 .5],'position',[600 300 300 400]);
montage(D,map);
uicontrol(op1,'position',[300 20 80 30],'string','fermer','foregroundcolor'...
    ,[.5 .4 .2],'fontname','arial black','fontsize',12,'cdata'...
    ,imread('systeme\d2.jpg'),'callback','close([figure(2) ,figure(3)])');
title('coupes axiales (IRM)','fontname','arial black','fontsize',12,'color',[1 .8 .2]...
    ,'backgroundcolor',[0.5 .5 .5]);
figure('color',[.41 .14 .2],'menubar','none','position',[200 300 100 100],'resize','off','visible','off');
mov = immovie(D,map);
movie(mov,3)
set(gcf,'visible','on');
clc