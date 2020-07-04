function transappliq2
global tx12 ty12 I1 I2 translatcert2 kI1
tx22=str2double(get(tx12,'string'));
tx22=round(tx22);
ty22=str2double(get(ty12,'string'));
ty22=round(ty22);
if isnan(tx22)||isnan(ty22)
     figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);

   uicontrol('style','text','position',[50 50 280 60],...
'string','Vous avez entr� une valeur non-num�rique'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);
uicontrol('position',[160 30 80 30],'string','OK','callback','close');

elseif (tx22<0)|| (ty22<0)
         figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);

   uicontrol('style','text','position',[50 50 280 60],...
'string','Vous avez entr� une valeur n�gative'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);
uicontrol('position',[160 30 80 30],'string','OK','callback','close');
else
 if kI1==3
    imr=I1(:,:,1);
    imv=I1(:,:,2);
    imb=I1(:,:,3);
    imr=trans(imr,tx22,ty22);
    imv=trans(imv,tx22,ty22);
    imb=trans(imb,tx22,ty22);
    I2=I1;
    I2(:,:,1)=imr;
    I2(:,:,2)=imv;
    I2(:,:,3)=imb;
 elseif kI1==1
    I1=uint8(I1)*255;
    I2=trans(I1,tx22,ty22);
    I2=im2bw(I2);
 else
    I2=trans(I1,tx22,ty22);
 end
axes('units','pixels','position',[90 50 250 200]); imshow(I2)
end
translatcert2=1;

function se=trans(img,tx22,ty22)
m=size(img,1);  
n=size(img,2);  
se=uint8(zeros(m,n));
for i=1:m-ty22
    for j=1:n-tx22
        se(i+ty22,j+tx22)=img(i,j);
    end
end