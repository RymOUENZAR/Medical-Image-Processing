function normaliser
global I1 a1 I2 kI1 certifN1

if kI1==3
%     h1=imhist(I1(:,:,1));   h2=imhist(I1(:,:,2));   h3=imhist(I1(:,:,3));
%     min1=min(min(h1));           min2=min(min(h2));           min3=min(min(h3));
%     max1=max(max(h1));           max2=max(max(h2));           max3=max(max(h3));
%     for i=1:mI1
%         for j=1:nI1
%     I2(i,j,1)=((I1(i,j,1)-min1)*255)/(max1-min1);
%     I2(i,j,2)=((I1(i,j,2)-min2)*255)/(max2-min2);
%     I2(i,j,3)=((I1(i,j,3)-min3)*255)/(max3-min3);
%     I2(i,j,1)=mat2gray(I2(i,j,1));
%     I2(i,j,2)=mat2gray(I2(i,j,2));
%     I2(i,j,3)=mat2gray(I2(i,j,3));
%         end
%     end

I2(:,:,1)=imadjust(I1(:,:,1));
I2(:,:,2)=imadjust(I1(:,:,2));
I2(:,:,3)=imadjust(I1(:,:,3));

else
%     h=imhist(I1);
%     Min=min(min(h)); Max=max(max(h));
%     I2(:,:)=((I1(:,:)-Min)*255)/(Max-Min);
%     I2=mat2gray(I2);

I2=imadjust(I1);
end
subplot(122),imshow(I2); title(a1,'color',[0 0 0],'Fontangle','Italic')
% axes('units','pixels','position',[320 80 250 200])
certifN1=1;