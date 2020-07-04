function tail
global rapp
% ********************* CHOIX DU REDIMENSIONNEMENT *************************
if (get(rapp,'value'))==(get(rapp,'max'))
    % Rapport
    taillerap
else
    % Hauteur x Largeur
    taillelar
end