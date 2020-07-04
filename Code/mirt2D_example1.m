% MIRT2D_EXAMPLE1: Non-rigid 2D registration example 1 with SSD similarity
% measure. 

%clear all; close all; clc;
global cc ssd MI Im1 Im2 I1 Ir i1 i2 Ir_registered I Rec
% im=imread('C:\Users\user\Documents\USTO\Master 2\SIVR\PFE\logiciel\logiciel\images\r_reca.bmp');
% refim=imread('C:\Users\user\Documents\USTO\Master 2\SIVR\PFE\logiciel\logiciel\images\r_ref.bmp');

I1=im2double(I1);
Ir=im2double(Ir);

if (get(cc,'value'))==(get(cc,'max'))
    close
    a=1;
    b='cc';
elseif (get(ssd,'value'))==(get(ssd,'max'))
    close
    a=2;
    b='ssd';
else
    close
    a=3;
    b='MI';
end

if (get(Im1,'value'))==(get(Im1,'max'))
    close
    refim=I1;
    im=Ir;
else
    close
    refim=Ir;
    im=I1;
end

 % Main settings
main.similarity=b;  % similarity measure, e.g. SSD, CC, SAD, RC, CD2, MS, MI 
main.subdivide=3;       % use 3 hierarchical levels
if (a==3)
    main.MIbins=64;         % number of bins for the Mutual Information similarity measure
    main.okno=10;            % mesh window size
    main.lambda = 0.01;    % transformation regularization weight, 0 for none
else
    main.okno=5;            % mesh window size
    main.lambda = 0.005;    % transformation regularization weight, 0 for none
end
main.single=1;          % show mesh transformation at every iteration

% Optimization settings
optim.maxsteps = 200;   % maximum number of iterations at each hierarchical level
optim.fundif = 1e-5;    % tolerance (stopping criterion)
optim.gamma = 1;       % initial optimization step size 
optim.anneal=0.8;       % annealing rate on the optimization step    
 

[res, newim]=mirt2D_register(refim,im, main, optim);

% res is a structure of resulting transformation parameters
% newim is a deformed image 
%
% you can also apply the resulting transformation directly as
% newim=mirt2D_transform(im, res);

close(Rec);

figure('name','Progression du recalage','position',[400 250 700 350],'resize','off'...
       ,'menubar','none','color',[1 1 1]);

subplot(131),imshow(refim); title('Image cible');
subplot(132),imshow(im);    title('Image source');
subplot(133),imshow(newim); title('Image recalée');


