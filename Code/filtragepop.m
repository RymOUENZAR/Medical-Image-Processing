function filtragepop
global popfilt fpara1 fpara2 fparat1 fparat2 ftail fpara3 fparat3 filtapp
methodfiltr=get(popfilt,'value');
switch methodfiltr
    case 1 %    Aucun
        set([fpara1 fpara2 fparat1 fparat2 ftail],'visible','off');
        set(filtapp,'visible','on');
    case 2 %    Médian
        set(filtapp,'visible','on');
    case 3  %   Moyenneur
        set([fpara1 fpara2 fparat1 fparat2 ftail filtapp],'visible','on');
        set(fparat1,'string','lignes :');
        set(fparat2,'string','colones :');
        set(fpara1,'string','3');
        set(fpara2,'string','3');
        set([fpara3 fparat3],'visible','off');
    case 4  %   gaussien
        set([fpara1 fpara2 fparat1 fparat2 ftail filtapp fpara3 fparat3],'visible','on');
        set(fparat1,'string','lignes :');
        set(fparat2,'string','colones :');
        set(fpara1,'string','3');
        set(fpara2,'string','3');
        set(fpara3,'string','0.5');
        set(fparat3,'string','sigma :');
    case 5 %    Sobel
        set([fpara1 fpara2 fparat1 fparat2 ftail fpara3 fparat3],'visible','off');
        set(filtapp,'visible','on');
    case 6 %    Prewitt
        set([fpara1 fpara2 fparat1 fparat2 ftail fpara3 fparat3],'visible','off');
        set(filtapp,'visible','on');
    case 7  %   laplacien
        set([fpara1 fparat1],'visible','on');
        set([fpara2 fpara3 fparat2 fparat3 ftail],'visible','off');
        set(fpara1,'string','20');
        set(fparat1,'string','alpha :');
end