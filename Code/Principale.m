 function Principale
% %**************************************************************************
 global precedentbutton RGBm binm indexm grism incom longueur hauteur F Texte0 BIOiconbutton
 global travb zoombutton mainbutton binaireb RGBb grisb indexedb ptsb chargb recb nombrsagit
 global f12 f13 f23 f24 path filename ext saveb recalagb
 global panelhisto histob statpanel statbutton nouvimgpanel nouvimgbutton ameliorpanel ameliorbutton
 global f21 f22 f25 profint f27 reli f28
 global frotat f35 f36 foutpix dil ftrans 
 global f31 f310 f32 f33 finv edg bruit filtr hysteres
 global f41 f42 f43 segr f411
 global rec1 rec2 rec3 rec4 rec41 rec42 rec43 
 global invbut tailbut  kI1 mI1 nI1 I1 I2 kI2 mI2 nI2 Ir a1 a2
 global Texte1 Texte2 Texte3 Texte4 Texte5 x map
 
close all, clear I1; clc
 longueur=600;
 hauteur=394;
 pos=[400 180 longueur hauteur];
 % load mirt2D_data1.mat; pour le non rigide
% %**************************************************************************
 A=figure('name','Mise en correspondance','position',pos,'menubar','none'...
         ,'color',[1 1 1],'resize','off');
     [x,map]=imread('C:\Users\user\Documents\USTO\Master 2\SIVR\PFE\Nouveau dossier\a.png');
image(x), axis off,hold on
ax=axes('position',[0 0 1 1]);
imagesc(x);
axis off
% text(.....);
     
% img1=imread ('C:\Users\user\Documents\USTO\Master 2\SIVR\PFE\Nouveau dossier\2.png');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Texte1=text(10,75,'Université des Sciences et de la Technologie d''ORAN -USTO- ',...
    'Fontname','Arial','Fontsize',15,'Fontangle','Italic','Fontweight','Bold','color',[.33 .725 .84]);

Texte2=text(175,100,'Département d''Electronique','Fontname','Arial','Fontsize',13,...
         'Fontangle','Italic','Fontweight','Bold','color',[.608 .84 .92]);
     
Texte3=text(85,140,'"Mise en correspondance des images médicales',...
    'Fontname','Arial','Fontsize',15,'Fontangle','Italic','Fontweight','Bold','color',[.33 .725 .84]);

Texte4=text(145,165,'Pour la Radiothérapie des tumeurs"','Fontname','Arial','Fontsize',15,...
         'Fontangle','Italic','Fontweight','Bold','color',[.33 .725 .84]);
     
Texte0=text(300,387,'Réalisé par : OUENZAR Rym Hakima - [USTO 2013]','Fontname','Arial','Fontsize',8,...
         'Fontangle','Italic','color',[.33 .725 .84]);

Texte0=uicontrol('style','text','position',[300 5 300 20]...
                    ,'backgroundcolor',[1 1 1],'foregroundcolor'...
                    ,[0 0 0],'visible','off','string',...
  'Réalisé par : OUENZAR Rym Hakima - [USTO 2013]'...
  ,'fontangle','italic','fontsize',8,'FontWeight','bold');                          

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

% Texte1=uicontrol('style','text','position',[15 300 570 25]...
%                     ,'backgroundcolor',[1 1 1],'foregroundcolor'...
%                     ,[.33 .725 .84],'visible','on','string','Université des Sciences et de la Technologie d''ORAN',...
%     'Fontname','Constantia','Fontsize',17,'Fontangle','Italic','Fontweight','Bold'); 
% 
% Texte2=uicontrol('style','text','position',[15 270 570 25]...
%                     ,'backgroundcolor',[1 1 1],'foregroundcolor'...
%                     ,[.33 .725 .84],'visible','on','string','-Mohamed Boudiaf-',...
%     'Fontname','Constantia','Fontsize',15,'Fontangle','Italic','Fontweight','Bold'); 
% 
% Texte3=uicontrol('style','text','position',[15 230 570 25]...
%                     ,'backgroundcolor',[1 1 1],'foregroundcolor'...
%                     ,[.608 .84 .92],'visible','on','string','Faculté de Génie Electrique - Département d’Electronique',...
%     'Fontname','Constantia','Fontsize',14,'Fontangle','Italic','Fontweight','Bold');  
% 
% Texte4=uicontrol('style','text','position',[15 190 570 30]...
%                     ,'backgroundcolor',[1 1 1],'foregroundcolor'...
%                     ,[.33 .725 .84],'visible','on','string','"Mise en correspondance des images médicales',...
%     'Fontname','Constantia','Fontsize',17,'Fontangle','Italic','Fontweight','Bold'); 
% 
% Texte5=uicontrol('style','text','position',[15 160 570 30]...
%                     ,'backgroundcolor',[1 1 1],'foregroundcolor'...
%                     ,[.33 .725 .84],'visible','on','string','Pour la Radiothérapie des tumeurs"',...
%     'Fontname','Constantia','Fontsize',17,'Fontangle','Italic','Fontweight','Bold'); 
     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%*****************************MENU FICHIER*********************************
 f1=uimenu(A,'label','&Fichier','foregroundcolor',[0 0 0],'accelerator','o');            
    f11=uimenu(f1,'label','&Ouvrir','callback','charger1','accelerator','o'...
                 ,'foregroundcolor',[0 0 0]);
             
                 path='images\';filename='';ext='';
                 
    f12=uimenu(f1,'label','&Sauvegarder','accelerator','s',...
                  'foregroundcolor',[0 0 0],'callback','sauvegarder');
              
%         f121=uimenu(f12,'label','image 1','foregroundcolor',[0 0 0]...
%                  ,'callback','sauvegarder1');
%         
%         f122=uimenu(f12,'label','image 2','foregroundcolor',[0 0 0]...
%                  ,'callback','sauvegarder2');
              
              
    f13=uimenu(f1,'label','&Quitter','separator','on','callback','QuitterDialog'...
                 ,'accelerator','q','foregroundcolor',[0 0 0]);
% %*****************************MENU IMAGE***********************************
f2=uimenu(A,'label','&Image','foregroundcolor',[0 0 0]);            
    f21=uimenu(f2,'label','&Binarisation'...
                 ,'foregroundcolor',[0 0 0]);
             f211=uimenu(f21,'label','&Automatique','foregroundcolor',[0 0 0],'callback','binauto');
             f212=uimenu(f21,'label','&Avec Seuil','foregroundcolor',[0 0 0],'callback','binseuil');
             f213=uimenu(f21,'label','&Bornée','foregroundcolor',[0 0 0],'callback','binseuil2');
             
    f22=uimenu(f2,'label','&inversion','foregroundcolor',[0 0 0]...
        ,'callback','inversion');
    
    f23=uimenu(f2,'label','&convertir en Gris','foregroundcolor',[0 0 0]...
                 ,'callback','color2gray');
%*****************************MENU OUTILS**********************************

%*****************************MENU PRETRAITEMENT***************************
f4=uimenu(A,'label','&Prétraitement','foregroundcolor',[0 0 0]);
    f41=uimenu(f4,'label','&contraste','foregroundcolor',[0 0 0]...
                 ,'callback','contrast');

%         f411=uimenu(f41,'label','modifier..','foregroundcolor',[0 0 0]...
%                  ,'callback','contraste2');
%         
%         f412=uimenu(f41,'label','filtres passe_haut','foregroundcolor',[0 0 0]...
%                  ,'callback','HPF2');

    f42=uimenu(f4,'label','&Luminance','foregroundcolor',[0 0 0]...
                 ,'callback','luminance');
             
    f43=uimenu(f4,'label','&Normalisation','foregroundcolor',[0 0 0]...
        ,'callback','normalisation');     
             
    f44=uimenu(f4,'label','&Egalisation','foregroundcolor',[0 0 0]...
        ,'callback','egali');              
    
%     f45=uimenu(f4,'label','&Bruitage','foregroundcolor',[0 0 0]...
%         ,'separator','on','callback','bruits');
    
    f46=uimenu(f4,'label','&Filtrage','foregroundcolor',[0 0 0]...
        ,'callback','filtrage');
% %*****************************MENU SEGMENTATION****************************
f5=uimenu(A,'label','&Segmentation','foregroundcolor',[0 0 0]);
    f51=uimenu(f5,'label','&Level-Set','foregroundcolor',[0 0 0]);
    f511=uimenu(f51,'label','&Objet','foregroundcolor',[0 0 0]...
        ,'callback','segcontrolauto');
    
    f521=uimenu(f51,'label','&Tumeur','foregroundcolor',[0 0 0]...
        ,'callback','segtum');          %PROBLEME !!!!!
    
%     f42=uimenu(f4,'label','&manuelle','foregroundcolor',[0 0 0]...
%         ,'callback','segcontrolmanu');
    
        
     f53=uimenu(f5,'label','&Niveaux du contour','foregroundcolor',[0 0 0]...
                 ,'separator','on','callback','nivcontour');  %PROBLEME avec le OK

%*****************************MENU RECALAGE********************************
f6=uimenu(A,'label','&Pré-Recalage','foregroundcolor',[0 0 0]);
    f61=uimenu(f6,'label','&Ouvrir une image','foregroundcolor',[0 0 0]...
        ,'callback','charger2');
    
    f62=uimenu(f6,'label','&Points de Contrôle','foregroundcolor',[0 0 0]);
    f622=uimenu(f62,'label','&Automatique','foregroundcolor',[0 0 0]...
        ,'callback','');
    f622=uimenu(f62,'label','&Manuel','foregroundcolor',[0 0 0]...
        ,'callback','sel_points');
    
    f63=uimenu(f6,'label','&Charger les points','foregroundcolor',[0 0 0]...
        ,'callback','save recale_points');
    
    f7=uimenu(A,'label','&Recalage','foregroundcolor',[0 0 0]);
       f71=uimenu(f7,'label','&Rigide','foregroundcolor',[0 0 0]);
       f711=uimenu(f71,'label','&Automatique','foregroundcolor',[0 0 0]...
            ,'callback','char_rigid');
        f712=uimenu(f71,'label','Manuel','foregroundcolor',[0 0 0]);
    f7121=uimenu(f712,'label','&Rotation','foregroundcolor',[0 0 0]...
                 ,'callback','rotation2');          %A revoir
    
    f7122=uimenu(f712,'label','&Translation','foregroundcolor',[0 0 0]...
                 ,'callback','translation2');
       f72=uimenu(f7,'label','&Affine','foregroundcolor',[0 0 0]);
            f721=uimenu(f72,'label','&Automatique','foregroundcolor',[0 0 0]...
            ,'callback','char_affine'); 
                f722=uimenu(f72,'label','Manuel','foregroundcolor',[0 0 0]);
    f7221=uimenu(f722,'label','&Rotation','foregroundcolor',[0 0 0]...
                 ,'callback','rotation2');          %A revoir
    
    f7222=uimenu(f722,'label','&Translation','foregroundcolor',[0 0 0]...
                 ,'callback','translation2');
    f7223=uimenu(f722,'label','&Homothétie','foregroundcolor',[0 0 0]...
                 ,'callback','taille');
        

        
%        f643=uimenu(f64,'label','&Projectif','foregroundcolor',[0 0 0]...
%             ,'callback','char_projec');
        
       f73=uimenu(f7,'label','&Non-Rigide','foregroundcolor',[0 0 0]...
            ,'callback','choi');
        
        
            nombrsagit=60;

