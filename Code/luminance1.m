function luminance1
global I1 b mI1 nI1 I2 kI1 certifL1 a1
I2=I1;
b=str2double(get(b,'string'));
if isnan(b)
     figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);

   uicontrol('style','text','position',[50 50 280 60],...
'string','Vous avez entré une valeur non-numérique'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);
uicontrol('position',[160 30 80 30],'string','OK','callback','close');

else
for i=1:mI1
    for j=1:nI1
        if kI1==3
            I2(i,j,:)=b+I1(i,j,:);
            if I2(i,j,:)>255
                I2(i,j,:)=255;
            end
        else
            I2(i,j)=b+I1(i,j);
            if I2(i,j)>255
                I2(i,j)=255;
            end
        end
    end
end
subplot(122),imshow(I2); title(a1,'color',[0 0 0],'Fontangle','Italic')
certifL1=1;
end