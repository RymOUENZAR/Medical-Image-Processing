function rotationappliq2
global imrot2 I1 rotatangleedit2 rotatt12 rotationtail2 kI1 hor ver
angles=get(rotatangleedit2,'string');
angle=str2double(angles);
m=size(I1,1);
n=size(I1,2);
if isnan(angle)
     figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);

   uicontrol('style','text','position',[50 50 280 60],...
'string','Vous avez entré une valeur non-numérique'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);
uicontrol('position',[160 30 80 30],'string','OK','callback','close');
else
    if (get(hor,'value'))==(get(hor,'max'))
if kI1==3
    imr=I1(:,:,1);
    imv=I1(:,:,2);
    imb=I1(:,:,3);
    for i=1:m
        for j=1:n
        imr2(i,j)=imr(i,n+1-j);
        imv2(i,j)=imv(i,n+1-j);
        imb2(i,j)=imb(i,n+1-j);
        end
    end
    imrot2(:,:,1)=imr2;
    imrot2(:,:,2)=imv2;
    imrot2(:,:,3)=imb2;
else
    for i=1:m
        for j=1:n
            imrot0(i,j)=imrot2(i,n+1-j);
        end
    end
    imrot2=imrot0;
end
    elseif(get(ver,'value'))==(get(ver,'max'))
        if kI1==3
    imr=I1(:,:,1);
    imv=I1(:,:,2);
    imb=I1(:,:,3);
    for i=1:m
        for j=1:n
        imr2(i,j)=imr(m+1-i,j);
        imv2(i,j)=imv(m+1-i,j);
        imb2(i,j)=imb(m+1-i,j);
        end
    end
    imrot2(:,:,1)=imr2;
    imrot2(:,:,2)=imv2;
    imrot2(:,:,3)=imb2;
else
    for i=1:m
        for j=1:n
            imrot0(i,j)=imrot2(m+1-i,j);
        end
    end
    imrot2=imrot0;
        end
    else
        imrot2=I1;
    end

    
if (get(rotatt12,'value'))==(get(rotatt12,'max'))
    if kI1==3
       imrot1(:,:,1)=rotation_entiere(imrot2(:,:,1),angle);
       imrot1(:,:,2)=rotation_entiere(imrot2(:,:,2),angle);
       imrot1(:,:,3)=rotation_entiere(imrot2(:,:,3),angle);
       imrot2=imrot1;
    else
       imrot2=rotation_entiere(imrot2,angle);
    end
else
    if kI1==3
       imrot0(:,:,1)=rotation_originale(imrot2(:,:,1),angle);
       imrot0(:,:,2)=rotation_originale(imrot2(:,:,2),angle);
       imrot0(:,:,3)=rotation_originale(imrot2(:,:,3),angle);
       imrot2=imrot0; 
    else
       imrot2=rotation_originale(imrot2,angle);
    end
end
%subplot(222),imshow(imrot2)
axes('units','pixels','position',[90 50 250 200]); imshow(imrot2)
mrot=size(imrot2,1);
msrot=num2str(mrot);
nrot=size(imrot2,2);
nsrot=num2str(nrot);
set(rotationtail2,'string',['taille [',msrot,' x ',nsrot,']']);
end


function e=rotation_originale(S,t)
%%%%%==========================rotation sans fct Matlab========
a=size(S,1);
b=size(S,2);
t1=(t*pi)/180;%%rad

e=uint8(zeros([a,b]));
Rnv=[cos(t1) sin(t1);-sin(t1) cos(t1)];
for i=1:a
for j=1:b
  G=Rnv*[i;j]+[a/2;b/2]+(-1)*Rnv*[a/2;b/2];
  F=round(G);
  x(i,j)=F(1,:); 
  y(i,j)=F(2,:); 
    if(x(i,j)>0 && x(i,j)<=a)&&(y(i,j)>0 && y(i,j)<=b)
      e(i,j)=S(x(i,j),y(i,j));
    end
end
end

function e=rotation_entiere(S,t)
%%%%%==========================rotation sans fct Matlab========
a=size(S,1);
b=size(S,2);
t1=(t*pi)/180;%%rad
m0=abs((sin(t1)*b))+abs((cos(t1)*a));l=round(m0);
n0=abs((sin(t1)*a))+abs((cos(t1)*b));k=round(n0);
l0=abs((l-a)/2);l1=round(l0);
k0=abs((k-b)/2);k1=round(k0);
g=uint8(zeros([l,k]));
if (l>=a && k>=b)
 for i=1:l
 for j=1:k
   if(i>l1 && i<=l1+a)&&(j>k1 && j<=k1+b)
     g(i,j)=S(i-l1,j-k1);
   end
 end
 end
else
 for i=1:l
 for j=1:k
  g(i,j)=0; 
 end
 end 
end
% %%%%=====algo de rotation======
e=uint8(zeros([l,k]));
Rnv=[cos(t1) sin(t1);-sin(t1) cos(t1)];
for i=1:l
for j=1:k
  G=Rnv*[i;j]+[l/2;k/2]+(-1)*Rnv*[l/2;k/2];
  F=round(G);
  x(i,j)=F(1,:); 
  y(i,j)=F(2,:); 
  if l<a
    if(x(i,j)>-l1 && x(i,j)<=a-l1)&&(y(i,j)>+k1 && y(i,j)<=b+k1)
      e(i,j)=S(x(i,j)+l1,y(i,j)-k1);
    end 
  elseif k<b
    if(x(i,j)>l1 && x(i,j)<=a+l1)&&(y(i,j)>-k1 && y(i,j)<=b-k1)
      e(i,j)=S(x(i,j)-l1,y(i,j)+k1);
    end
  else    
    if(x(i,j)>0 && x(i,j)<=l)&&(y(i,j)>0 && y(i,j)<=k)
      e(i,j)=g(x(i,j),y(i,j));
    end
  end
end
end