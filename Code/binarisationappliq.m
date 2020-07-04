function binarisationappliq
global I1 I2 binseuil seuilactu seuilactuel kI1 mI1 nI1
seuilval=str2double(get(binseuil,'string'));

if (isnan(seuilval)) || (seuilval<0) || (seuilval>255)
     figure('name','Erreur','color',[1 1 1],'menubar','none'...
        ,'resize','off','position',[500 300 400 150]);

    uicontrol('style','text','position',[50 50 280 60],...
'string','Le seuil doit �tre entre 0 et 255'...
,'fontsize',10,'fontangle','italic'...
,'backgroundcolor',[1 1 1]);

uicontrol('position',[160 30 80 30],'string','OK','callback','close');

else
seuilval2=seuilval/255;
seuilactuel=num2str(seuilval);
I2=im2bw(I1,seuilval2);
% if kI1==1
%     for i=1:mI1
%         for j=1:nI1
%             if I1(i,j)>seuilval2
%                 I2(i,j)=255;
%             else
%                 I2(i,j)=0;
%             end
%         end
%     end
% else
%         for i=1:mI1
%         for j=1:nI1
%             if I1(i,j,:)>seuilval2
%                 I2(i,j,:)=255;
%             else
%                 I2(i,j,:)=0;
%             end
%         end
%         end
% end
subplot(122),imshow(I2)
end