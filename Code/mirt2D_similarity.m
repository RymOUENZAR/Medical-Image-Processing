% mirt2D_similarity  The function computes the current similarity measure
% value and its dense gradients

% Copyright (C) 2007-2010 Andriy Myronenko (myron@csee.ogi.edu)
% also see http://www.bme.ogi.edu/~myron/matlab/MIRT/

function [f,ddx,ddy,imsmall]=mirt2D_similarity(main, Xx, Xy)

% interpolate image and its gradients
im_int=mirt2D_mexinterp(main.imsmall, Xx, Xy);
clear Xx Xy tmp;

imsmall=im_int(:,:,1); 

% Compute the similarity function value (f) and its gradient (dd)
switch lower(main.similarity)
   
   % sum of squared differences
   case 'ssd' 
        dd=imsmall-main.refimsmall;
        f=nansum(dd(:).^2)/2;
     
   % correlation coefficient     
   case 'cc' 
       
       %SJ=main.refimsmall-nansum(main.refimsmall(:))/numel(main.refimsmall);
       %SI=imsmall-nansum(imsmall(:))/numel(imsmall);
       mask=isnan(main.refimsmall+imsmall);
       main.refimsmall(mask)=nan;
       imsmall(mask)=nan;
       
       SJ=main.refimsmall-nanmean(main.refimsmall(:));
       SI=imsmall-nanmean(imsmall(:));
       
       
       a = nansum(imsmall(:).*SJ(:))/nansum(imsmall(:).*SI(:));
       f=-a*nansum(imsmall(:).*SJ(:));
       dd=-2*(a*SJ-a^2*SI);

  % (minus) Mutual Information: Paul A. Viola "Alignment by Maximization of Mutual Information"   
  case 'mi' 
        % MI computation is somewhat more involved, so let's compute it in separate function       
        [f, dd]=mirt_MI(main.refimsmall,imsmall,main.MIbins);
       
      
    otherwise
        error('Similarity measure is wrong. Supported values are RC, CC, MI, SAD, SSD, CD2, MS')
end


% Multiply by interpolated image gradients
ddx=dd.*im_int(:,:,2); ddx(isnan(ddx))=0;
ddy=dd.*im_int(:,:,3); ddy(isnan(ddy))=0;

% This subfunctions finds the coordinates of the largest square
% within the image that has no NaNs (not affected by interpolation)
% It can be useful to ignore the border artifacts caused by interpolation,
% or when the actual image has some black border around it, that you don't
% want to take into account.
function [y,x]=find_imagebox(im)
[i,j]=find(~isnan(im)); 
n=4; % border size
y=min(i)+n:max(i)-n;
x=min(j)+n:max(j)-n;

