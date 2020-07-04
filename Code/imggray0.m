function imggray0
global flag I1 I2 kI1 mI1 nI1

if kI1==3 
    I2=rgb2gray(I1);
elseif kI1==1
    I2=I1;
% elseif flag==5
%     imggray=uint8(I1*255);
end  