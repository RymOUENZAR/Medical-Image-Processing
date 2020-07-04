function inversionappliq
global I1 I2 mI1s nI1s a1 travb mI1 nI1 kI1

I2=imcomplement(I1);
% if kI1==1
% for i=1:mI1
%     for j=1:nI1
%         I2(i,j)=255-I1(i,j);
%     end
% end
% else
%     for i=1:mI1
%     for j=1:nI1
%         I2(i,j,:)=255-I1(i,j,:);
%     end
%     end
% end
axes('units','pixels','position',[20 65 350 300]); imshow(I2);