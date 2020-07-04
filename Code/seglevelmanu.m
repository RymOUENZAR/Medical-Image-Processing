function seglevelmanu
global I1 a1 mI1s nI1s u2 mresiz2 nresiz2 niteration2 alfaset2 f
mt=size(I1,1);
nt=size(I1,2);
Img=double(I1(:,:,1));
mres=str2double(get(mresiz2,'string'));
nres=str2double(get(nresiz2,'string'));
alfa=str2double(get(alfaset2,'string'));
niter=str2double(get(niteration2,'string'));
if (isnan(mres)) || (isnan(nres)) || (isnan(alfa)) || (isnan(niter))
     figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);

   uicontrol('style','text','position',[50 50 280 60],...
       'string','Vous avez entré une valeur non-numérique'...
    ,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);

uicontrol('position',[160 30 80 30],'string','OK','callback','close');

elseif (mres<2) || (nres<2)
     figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);
   uicontrol('style','text','position',[150 50 300 80],...
'string','La taille est trop petite'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);

uicontrol('position',[160 30 80 30],'string','OK','callback','close');
elseif alfa<0
     figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);
   uicontrol('style','text','position',[150 50 300 80],...
'string','Alpha doit être positive'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);

uicontrol('position',[160 30 80 30],'string','OK','callback','close');
elseif niter<1
     figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);
   uicontrol('style','text','position',[150 50 300 80],...
'string','Le nombre d''itérations est trop petit'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);

uicontrol('position',[160 30 80 30],'string','OK','callback','close');
else

Img=imresize(Img,[mres nres]);
sigma=1.5;
G=fspecial('gaussian',15,sigma);
Img_smooth=conv2(Img,G,'same');
[Ix,Iy]=gradient(Img_smooth);
f=Ix.^2+Iy.^2;
g=1./(1+f);
epsilon=1.5;
timestep=5;
mu=0.2/timestep;
lambda=5;
alf=alfa;
[nrow, ncol]=size(Img);
set(f,visible
hold on;
BW = roipoly;
set(f,'visible','off');
c0=4;
initialLSF= c0*2*(0.5-BW);
u=initialLSF;
[c,h] = contour(u,[0 0],'g');
u=initialLSF;
imagesc(Img, [0, 255]);colormap(gray);hold on;
[c,h] = contour(u,[0 0],'g');                          
title('Contour initialr');
for n=1:niter
    u=EVOLUTION(u, g ,lambda, mu, alf, epsilon, timestep, 1);      
    if mod(n,10)==0
        pause(0.001);
        imagesc(Img, [0, 255]);colormap(gray);hold on;
        [c,h] = contour(u,[0 0],'g'); 
        iterNum=[num2str(n), ' itérations,/',num2str(niter)];        
        title(iterNum,'color',[1 .8 .2]);
        xlabel([a1,' (',num2str(mres),' x ',num2str(nres),')'],'color',[0 0 0],'fontangle','italic')
        hold off;
    end
end
Img=imresize(Img,[mt nt]);
totalIterNum=[num2str(n), ' itérations'];  
subplot(121),imshow(Img/255),title(['Contour Final, ', totalIterNum],'color',[1 .8 .2]);
colormap(gray);hold on;
u2=imresize(u,[mt nt]);
u2=imcomplement(u2);
u2=uint8(u2*255);
[c,h] = contour(u2,[0 0],'g');
subplot(122),imshow(u2),title('Résultat de Segmentation','color',[1 .8 .2]);
set(gcf,'position',[100 100 700 500]);
end