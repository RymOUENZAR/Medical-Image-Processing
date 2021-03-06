function levelset2
global I1 Cx Cy niteration alfaset sigmaset mI1 nI1 a1
Img=double(I1(:,:,1));
Img=imresize(Img,[200 200]);
Cy=str2double(get(Cy,'string'));
Cx=str2double(get(Cx,'string'));
alfa=str2double(get(alfaset,'string'));
niter=str2double(get(niteration,'string'));
sigma=str2double(get(sigmaset,'string'));

if (isnan(Cx)) || (isnan(Cy)) || (isnan(alfa)) || (isnan(niter)) || (isnan(sigma))
     figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);

   uicontrol('style','text','position',[50 50 280 60],...
'string','Vous avez entr� une valeur non-num�rique'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);
uicontrol('position',[160 30 80 30],'string','OK','callback','close');

elseif (Cy<1) || (Cx<1)
     figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);

   uicontrol('style','text','position',[50 50 300 60],...
'string','Les coordonn�es du pixels doivent �tre sup�rieur ou �gal � 1'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);
uicontrol('position',[160 30 80 30],'string','OK','callback','close');

elseif alfa>=0
     figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);

   uicontrol('style','text','position',[55 50 280 60],...
'string','Alpha doit �tre n�gative'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);
uicontrol('position',[160 30 80 30],'string','OK','callback','close');

elseif sigma<0
     figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);

   uicontrol('style','text','position',[55 50 280 60],...
'string','Sigma doit �tre positive'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);
uicontrol('position',[160 30 80 30],'string','OK','callback','close');

elseif niter<1
     figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);

   uicontrol('style','text','position',[55 50 280 60],...
'string','Le nombre d''it�rations doit �tre sup�rieur � 1'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);
uicontrol('position',[160 30 80 30],'string','OK','callback','close');
else

M=mI1/2; N=nI1/2;
dim=size(Img);
c1=mI1/dim(1); c2=nI1/dim(2);
Cx=Cx/c1; Cy=Cy/c2;
%    CALCUL D'UNE ENERGIE EXTERNE QUI DEPLACE LA COURBE DE NIVEAU ZERO VERS
%                             LES FRONTIERES D'OBJET
% sigma=4.2; %1.5
G=fspecial('gaussian',15,sigma);
Img_smooth=conv2(Img,G,'same'); 
[Ix,Iy]=gradient(Img_smooth); 
f=Ix.^2+Iy.^2;
g=1./(1+f);% Fonction indicatrice de contours g = 1/1+|DELTA(G)*I|^2
epsilon=1.5;
timestep=5;
mu=0.2/timestep;
lambda=5;
[nrow, ncol]=size(Img);  
c0=2;  
initialLSF=c0*ones(nrow,ncol);
w=8;
initialLSF(Cy-2:Cy+2, Cx-2:Cx+2)=0;
initialLSF(Cy-2:Cy+2, Cx-2:Cx+2)=-c0;
u=initialLSF;
subplot(122), imshow(Img/255); colormap(gray); hold on;                        
for n=1:niter
    u=EVOLUTION(u, g ,lambda, mu, alfa, epsilon, timestep, 1);     
    if mod(n,10)==0
        pause(0.001);
        subplot(122),imshow(Img/255);colormap(gray);hold on;
        [c,h] = contour(u,[0 0],'g'); 
        iterNum=[num2str(n), ' it�rations/',num2str(niter)];        
        title(iterNum);
        hold off;
    end
end
Img=imresize(Img,[mI1 nI1]);
totalIterNum=[num2str(n), ' it�rations'];  
subplot(222),imshow(Img/255),title(['Contour Final, ', totalIterNum]);
colormap(gray);hold on;
u2=imresize(u,[mI1 nI1]);
u2=imcomplement(u2);
u2=uint8(u2*255);
[c,h] = contour(u2,[0 0],'g');
subplot(224),imshow(u2),title('R�sultat de la Segmentation');
I2=Img/255;
end