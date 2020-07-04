function bruitappliq
global I2 popbruit para1 para2 I1 brtcertif
method=get(popbruit,'value');
switch method
    case 1  %gaussian
        moyennes=get(para1,'string');
        moyenne=str2double(moyennes);
        moyenne=moyenne/100;
        variances=get(para2,'string');
        variance=str2double(variances);
        variance=variance/100;
        if (isnan(moyenne)) || (isnan(variance))
             figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);

    uicontrol('style','text','position',[50 50 280 60],...
'string','Vous avez entré une valeur non-numérique'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);

uicontrol('position',[160 30 80 30],'string','OK','callback','close');
        elseif (moyenne>1) || (variance>1) || (moyenne<0) || (variance<0)
 figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);

   uicontrol('style','text','position',[50 50 300 60],...
'string','La moyenne et la variance doivent être entre 0 et 100 '...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);
uicontrol('position',[160 30 80 30],'string','OK','callback','close');
        else
        I2=imnoise(I1,'gaussian',moyenne,variance);
        subplot(122),imshow(I2), title(a1,'color',[0 0 0],'Fontangle','Italic')
        end
    case 3  %salt & pepper
        densites=get(para1,'string');
        densite=str2double(densites);
        densite=densite/100;
        if isnan(densite)
             figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);

    uicontrol('style','text','position',[50 50 280 60],...
'string','Vous avez entré une valeur non-numérique'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);
uicontrol('position',[160 30 80 30],'string','OK','callback','close');
        elseif (densite>1) || (densite<0)
   figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);

   uicontrol('style','text','position',[50 50 300 60],...
'string','La densité doit être entre 0 et 100 '...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);
uicontrol('position',[160 30 80 30],'string','OK','callback','close');
        else
        I2=imnoise(I1,'salt & pepper',densite);
        subplot(122),imshow(I2), title(a1,'color',[0 0 0],'Fontangle','Italic')
        end
    case 4  %speckle
        variances=get(para1,'string');
        variance=str2double(variances);
        variance=variance/100;
        if isnan(variance)
             figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);

    uicontrol('style','text','position',[50 50 280 60],...
'string','Vous avez entré une valeur non-numérique'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);
uicontrol('position',[160 30 80 30],'string','OK','callback','close');
        elseif (variance>1) || (variance<0)
   figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);

   uicontrol('style','text','position',[50 50 300 60],...
'string','La varience doit être entre 0 et 100 '...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);
uicontrol('position',[160 30 80 30],'string','OK','callback','close');
        else
        I2=imnoise(I1,'speckle',variance);
        subplot(122),imshow(I2), title(a1,'color',[0 0 0],'Fontangle','Italic')
        end
end
brtcertif=1;