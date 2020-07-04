function bruitpop
global I1 popbruit para1 para2 parat1 parat2 I2 brtapp brtcertif
method=get(popbruit,'value');
switch method
    case 1  % bruit Gaussian
        set([para1 para2 parat1 parat2 brtapp],'visible','on');
        set(parat1,'string','moyenne :');
        set(parat2,'string','variance :');
        set(para1,'string','0','tooltipstring','Entrez la moyenne');
        set(para2,'string','1','tooltipstring','Entrez la variance');
    case 2  % bruit Poisson
        I2=imnoise(I1,'poisson');subplot(122),imshow(I2)
        set([para1 para2 parat1 parat2 brtapp],'visible','on');
        set([para1 para2 parat1 parat2 brtapp],'visible','off');
        brtcertif=1;
    case 3  % bruit Salt & Pepper
        set([para1 parat1 brtapp],'visible','on');
        set([para2 parat2],'visible','off');
        set(parat1,'string','densité :');
        set(para1,'string','5','tooltipstring','Entrez la densité');
    case 4  % bruit Speckle
        set([para1 parat1 brtapp],'visible','on');
        set([para2 parat2],'visible','off');
        set(parat1,'string','variance :');
        set(para1,'string','4','tooltipstring','Entrez la variance');
end