function binarisationborne
global borne1 borne2 I1 I2 
vals1=get(borne1,'string');
vals2=get(borne2,'string');
val1=str2double(vals1);
val2=str2double(vals2);
if isnan(val1) || isnan(val2)
     figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);

   uicontrol('style','text','position',[50 50 280 60],...
       'string','Vous avez entré une valeur non-numérique'...
    ,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);

uicontrol('position',[160 30 80 30],'string','OK','callback','close');

elseif (val1>255) || (val2>255) || (val1<0) || (val2<0)
     figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);
   uicontrol('style','text','position',[150 50 300 80],...
'string','Le bornes doivent être entre 0 et 255'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);

uicontrol('position',[160 30 80 30],'string','OK','callback','close');

else
[m n]=size(I1);
I2=I1;
if val1>val2
    maxi=val1;
    mini=val2;
    for i=1:m
        for j=1:n
            if (mini <= I1(i,j)) && (I1(i,j) <= maxi)
                I2(i,j)=255;
            else
                I2(i,j)=0;
            end
        end
    end
I2=im2bw(I2);
subplot(122),imshow(I2)
elseif val1<val2
    maxi=val2;
    mini=val1;
    for i=1:m
        for j=1:n
            if (mini <= I1(i,j)) && (I1(i,j) <= maxi)
                I2(i,j)=255;
            else
                I2(i,j)=0;
            end
        end
    end
I2=im2bw(I2);
subplot(122),imshow(I2)
else
    for i=1:m
        for j=1:n
            if I1(i,j)==val1
                I2(i,j)=255;
            else
                I2(i,j)=0;
            end
        end
    end
    I2=im2bw(I2);
    subplot(122),imshow(I2)
end
end