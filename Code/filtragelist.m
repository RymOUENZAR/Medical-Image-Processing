function filtragelist
global listfilt img im flag filtcertif
methodfilt=get(listfilt,'value');
switch methodfilt
    case 1  %   median
        if flag==4
        imr=img(:,:,1);
        imv=img(:,:,2);
        imb=img(:,:,3);
        imr2=medfilt2(imr);
        imv2=medfilt2(imv);
        imb2=medfilt2(imb);
        im(:,:,1)=imr2;
        im(:,:,2)=imv2;
        im(:,:,3)=imb2;
        else
           im=medfilt2(img);
        end
    case 2  %   moyenneur
        h=[1 1 1;1 1 1;1 1 1]/9;
        im=imfilter(img,h);
    case 3  %   gaussien
        h=[1 2 1;2 4 2;1 2 1]/16;
        im=imfilter(img,h);
    case 4  %   sobel
        h=fspecial('sobel');
        im=imfilter(img,h);
    case 5  %   prewitt
        h=fspecial('prewitt');
        im=imfilter(img,h);  
    case 6  %   laplacien
        h=fspecial('laplacian');
        im=imfilter(img,h);
end
filtcertif=1;
subplot(222),imshow(im)