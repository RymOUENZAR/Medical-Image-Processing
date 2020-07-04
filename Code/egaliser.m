function egaliser
global I1 a1 I2 kI1 certifE1

if kI1==3
%     h1=imhist(I1(:,:,1));   h2=imhist(I1(:,:,2));   h3=imhist(I1(:,:,3));
%     min1=min(h1);           min2=min(h2);           min3=min(h3);
%     max1=max(h1);           max2=max(h2);           max3=max(h3);
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

I2(:,:,1)=histeq(I1(:,:,1));
I2(:,:,2)=histeq(I1(:,:,2));
I2(:,:,3)=histeq(I1(:,:,3));

else
%     h=imhist(I1);
%     Min=min(h); Max=max(h);
%     I2(:,:)=((I1(:,:)-Min)*255)/(Max-Min);
%     I2=mat2gray(I2);

I2=histeq(I1);
end
subplot(122),imshow(I2); title(a1,'color',[0 0 0],'Fontangle','Italic')
certifE1=1;