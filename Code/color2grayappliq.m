function color2grayappliq
global I1 I2 mI1s nI1s a1 travb mI1 nI1 kI1

I2=rgb2gray(I1);
% if kI1==3
% for i=1:mI1
%     for j=1:nI1
%         I2(i,j,:)=(I1(i,j,1)+I1(i,j,2)+I1(i,j,3))/3;
%     end
% end
% else I2=I1;
% end
axes('units','pixels','position',[20 65 350 300]); imshow(I2);