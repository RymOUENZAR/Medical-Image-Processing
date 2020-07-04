function seglevelauto
global I1 I2 mI1 nI1 u2 mresiz nresiz alfaset niteration
Img=double(I1(:,:,1));
mres=str2double(get(mresiz,'string'));
nres=str2double(get(nresiz,'string'));
alfa=str2double(get(alfaset,'string'));
niter=str2double(get(niteration,'string'));

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

   uicontrol('style','text','position',[50 50 300 60],...
'string','La taille est trop petite'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);
uicontrol('position',[160 30 80 30],'string','OK','callback','close');

elseif alfa<0
     figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);

   uicontrol('style','text','position',[55 50 280 60],...
'string','Alpha doit être positive'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);
uicontrol('position',[160 30 80 30],'string','OK','callback','close');

elseif niter<1
     figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);

   uicontrol('style','text','position',[55 50 280 60],...
'string','Le nombre d''itérations doit être supérieur à 1'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);
uicontrol('position',[160 30 80 30],'string','OK','callback','close');
else

Img=imresize(Img,[mres nres]);
%    CALCUL D'UNE ENERGIE EXTERNE QUI DEPLACE LA COURBE DE NIVEAU ZERO VERS
%                             LES FRONTIERES D'OBJET
sigma=1.5;
G=fspecial('gaussian',15,sigma);
Img_smooth=conv2(Img,G,'same'); 
[Ix,Iy]=gradient(Img_smooth); 
f=Ix.^2+Iy.^2;
g=1./(1+f);% Fonction indicatrice de contours g = 1/1+|DELTA(G)*I|^2
epsilon=1.5;
timestep=5;
mu=0.2/timestep;
lambda=5;
alf=alfa;
[nrow, ncol]=size(Img);  
c0=4;  
initialLSF=c0*ones(nrow,ncol);
w=8;
initialLSF(w+1:end-w, w+1:end-w)=0;
initialLSF(w+2:end-w-1, w+2: end-w-1)=-c0;
u=initialLSF;
subplot(122),imshow(Img/255);colormap(gray);hold on;
                        
for n=1:niter
    u=EVOLUTION(u, g ,lambda, mu, alf, epsilon, timestep, 1);     
    if mod(n,10)==0
        pause(0.001);
        subplot(122),imshow(Img/255);colormap(gray);hold on;
        [c,h] = contour(u,[0 0],'g'); 
        iterNum=[num2str(n), ' itérations/',num2str(niter)];        
        title(iterNum);
        hold off;
    end
end
Img=imresize(Img,[mI1 nI1]); 
subplot(222),imshow(Img/255),title('Contour Final');
colormap(gray);hold on;
u2=imresize(u,[mI1 nI1]);
u2=imcomplement(u2);
u2=uint8(u2*255);
[c,h] = contour(u2,[0 0],'g');
subplot(224),imshow(u2),title('Résultat de la Segmentation');
I2=Img/255;
% set(gcf,'position',[100 100 700 500]);

% uicontrol('style','text','position',[235 407 250 30],'string','S E G M E N T A T I O N'...
%      ,'fontname','Harrington','fontweight','bold','fontsize',16,'foregroundcolor',[1 .8 .2]...
%      ,'backgroundcolor',[.5 .5 .5],'horizontalalignment','left');
%  uicontrol('position',[50 400 110 87],'CData',imread('systeme\icon.jpg'),'Enable','inactive');
% uicontrol('style','text','position',[10 30 380 20],'string',['image  :[',filename,ext,']']...
%     ,'foregroundcolor',[1 1 1],'fontsize',12,'backgroundcolor',[.5 .5 .5]...
%     ,'horizontalalignment','left','fontweight','bold');
% uicontrol('style','text','position',[10 10 380 20],'string',['taille     :[',ms,'x',ns,']']...
%     ,'foregroundcolor',[1 1 1],'fontsize',12,'backgroundcolor',[.5 .5 .5]...
%     ,'horizontalalignment','left','fontweight','bold');
% uicontrol('position',[600 10 80 30],'string','annuler','foregroundcolor',[.5 .4 .2]...
%     ,'cdata',imread('systeme\d2.jpg'),'fontname','arial black','fontsize',12,...
%     'callback','close');
% uicontrol('position',[500 10 80 30],'string','OK','foregroundcolor',[0 .55 0]...
%     ,'cdata',imread('systeme\appliq.jpg'),'fontsize',12,'fontname','arial black'...
%     ,'callback','segmautoOK');
end