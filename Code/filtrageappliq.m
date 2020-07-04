function filtrageappliq
global I1 I2 popfilt fpara1 fpara2 fpara3 filtcertif kI1 a1
methodpop=get(popfilt,'value');
switch methodpop
    case 1 % Aucun
        I2=I1;
        subplot(122),imshow(I2), title(a1,'color',[0 0 0],'Fontangle','Italic')
    case 2 % Médian
        if kI1==3
        I2r=I1(:,:,1);
        I2v=I1(:,:,2);
        I2b=I1(:,:,3);
        I2r2=medfilt2(I2r);
        I2v2=medfilt2(I2v);
        I2b2=medfilt2(I2b);
        I2(:,:,1)=I2r2;
        I2(:,:,2)=I2v2;
        I2(:,:,3)=I2b2;
        else
           I2=medfilt2(I1);
        end
        subplot(122),imshow(I2), title(a1,'color',[0 0 0],'Fontangle','Italic')
   case 3  %   moyenneur
       flin=str2double(get(fpara1,'string'));
       fcol=str2double(get(fpara2,'string'));
       if (isnan(flin)) || (isnan(fcol))
     figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);

   uicontrol('style','text','position',[50 50 280 60],...
'string','Vous avez entré une valeur non-numérique'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);
uicontrol('position',[160 30 80 30],'string','OK','callback','close');

       elseif (flin<=0) || (fcol<=0)
     figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);

   uicontrol('style','text','position',[50 50 280 60],...
'string','Les valeurs des lignes et colonnes doivent être positives'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);
uicontrol('position',[160 30 80 30],'string','OK','callback','close');
       else
       filtr=fspecial('average',[flin fcol]);
       I2=imfilter(I1,filtr);
       subplot(122),imshow(I2), title(a1,'color',[0 0 0],'Fontangle','Italic')
       end
    case 4  %   gaussien
        flin=str2double(get(fpara1,'string'));
        fcol=str2double(get(fpara2,'string'));
        sigma=str2double(get(fpara3,'string'));
        if (isnan(flin)) || (isnan(fcol)) || (isnan(sigma))
     figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);

   uicontrol('style','text','position',[50 50 280 60],...
'string','Vous avez entré une valeur non-numérique'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);
uicontrol('position',[160 30 80 30],'string','OK','callback','close');

               elseif (flin<=0) || (fcol<=0)
     figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);

   uicontrol('style','text','position',[50 50 280 60],...
'string','Les valeurs des lignes et colonnes doivent être positives'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);
uicontrol('position',[160 30 80 30],'string','OK','callback','close');

               elseif sigma<=0
     figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);

   uicontrol('style','text','position',[50 50 280 60],...
'string','Sigma doit être positive'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);
uicontrol('position',[160 30 80 30],'string','OK','callback','close');
              
       else
        filtr=fspecial('gaussian',[flin fcol],sigma);
        I2=imfilter(I1,filtr);
        subplot(122),imshow(I2), title(a1,'color',[0 0 0],'Fontangle','Italic')
        end
    case 5 %    Sobel
        filtr=fspecial('sobel');
        I2=imfilter(I1,filtr);
        subplot(122),imshow(I2), title(a1,'color',[0 0 0],'Fontangle','Italic')
    case 6 %    Prewitt
        filtr=fspecial('prewitt');
        I2=imfilter(I1,filtr);
        subplot(122),imshow(I2), title(a1,'color',[0 0 0],'Fontangle','Italic')
    case 7  %   laplacien
        alph=str2double(get(fpara1,'string'))/100;
        if isnan(alph)
     figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);

   uicontrol('style','text','position',[50 50 280 60],...
'string','Vous avez entré une valeur non-numérique'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);
uicontrol('position',[160 30 80 30],'string','OK','callback','close');
            
        elseif (alph<0) || (alph>1)
     figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);

   uicontrol('style','text','position',[50 50 280 60],...
'string','La valeur de Alpha doit être entre 0 et 100'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);
uicontrol('position',[160 30 80 30],'string','OK','callback','close');

        else
        filtr=fspecial('laplacian',alph);
        I2=imfilter(I1,filtr);
        subplot(122),imshow(I2), title(a1,'color',[0 0 0],'Fontangle','Italic')
        end
    
end

filtcertif=1;