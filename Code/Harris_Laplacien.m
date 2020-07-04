function Harris_Laplacien
global Ir I1
img=Ir;
img1=I1;
dim=size(img);
% if (dim(3)==3)
%     img=rgb2gray(img);
% end
    pt  = kp_harrislaplace(img);
    draw(img,pt,'Harris Laplace');
    pt1  = kp_harrislaplace(img1);
    draw(img1,pt1,'Harris Laplace');
end

function draw(img,pt,str)
    figure('Name',str);
    imshow(img);
    hold on;
    axis off;
    switch size(pt,2)
        case 2
            s = 2;
            for i=1:size(pt,1)
                rectangle('Position',[pt(i,2)-s,pt(i,1)-s,2*s,2*s],'Curvature',[0 0],'EdgeColor','b','LineWidth',2);
            end
        case 3
            for i=1:size(pt,1)
                rectangle('Position',[pt(i,2)-pt(i,3),pt(i,1)-pt(i,3),2*pt(i,3),2*pt(i,3)],'Curvature',[1,1],'EdgeColor','w','LineWidth',2);
            end
    end
end