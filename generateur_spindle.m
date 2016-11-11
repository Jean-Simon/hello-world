%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ce script permet de générer un spindle
% TEST AJOUT DE CHOSES POUR GITHUB
% Auteur: Jean-Simon Boucher
% Date: Octobre 2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [spindle] = generateur_spindle(freq_up, freq_down, fs, facteur) 

%Test JML%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% t=0:1/600:8;
% t = t(300:300+4095);
% t1 = 2.7; 
% s1 = 0.25^2; 
% g1 = exp(-0.5*(t-t1).^2/s1); 
% f1 = 15; 
% sig1 = g1.*cos(2*pi*f1*t);
% t2 = 4.0; 
% s2 = 0.8^2;
% g2 = exp(-0.5*(t-t2).^2/s2); 
% f2 = 9; 
% sig2 = 0.8*g2.*cos(2*pi*f2*t);
% figure; 
% plot(t,sig1+sig2)

%MODIFICATION PAR JS
t=0:1/600:0.6;
% t = t(1:200+512);
t1 = 0.30; 
s1 = 0.06^2; 
g1 = exp(-0.25*(t-t1).^2/s1); 
f1 = 15; 
spindle = g1.*cos(2*pi*f1*t);

figure; 
plot(t,spindle)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% *************************      Parametres        ***********************
% freq_delta  = 1;                        % Variation fréquentielle du spindles   
% 
% dt_peak   = 0.4/facteur;                        % Durée du plateau de l'enveloppe (seconde)
% dt_r    = (1.6/facteur-dt_peak-1/facteur);      % Durée de monté de l'enveloppe (seconde)
% dt_f    = (1.6/facteur-dt_peak-dt_r);           % Durée de descente de l'enveloppe (seconde)
% dt_env    = dt_peak+dt_r+dt_f;                  % Durée total de l'enveloppe du spindle (seconde) 
% dt_sig    = 2/facteur;                          % Durée du signal (0 en dehors de l'enveloppe) (seconde)
% dt_empty  = (dt_sig-dt_env)/2;                  % Durée avant et après spindles sur le signal (seconde)
% %**************************************************************************
% 
% %% Initialisation de l'intervalle de temps du signal et de l'enveloppe
% time_tot = [1,1:fs*dt_sig-1/fs]./fs;    % Init temporelle du signal
% time_env = [1,1:fs*dt_env-1]./fs;       % Init temporelle de l'envoloppe
% 
% %% Définition de l'enveloppe du spindle
% empt = zeros(1,ceil(fs*dt_empty));  % Init échantillons de la partie vide
% 
% env_deb = exp(-[-dt_r:1/fs:-1/fs].^2/(dt_r/2)^2);
% env_fin = exp(-[0:1/fs:dt_f-2/fs].^2/(dt_f/2)^2);
% env_mid = ones (1, size(time_tot,2)-size(env_deb,2)-size(env_fin,2)-2*size(empt,2));
% 
% env_tot = [empt,env_deb,env_mid,env_fin,empt];
% 
% % figure;plot(time_tot,env_tot);
% 
% %% Définition du spindle
% ft = [freq_up.*time_tot(1:size(time_tot,2)/2),freq_down.*time_tot(size(time_tot,2)/2+1:end)]; %Spindle avec régression fréquentielle (abrupte)
% % ft = [freq_up.*time_tot(1:ceil(10*fs/freq_up)),freq_down.*time_tot(ceil(10*fs/freq_up)+1:end)]; %Spindle avec régression fréquentielle (abrupte)
% % ft = freq.*time_tot;      %Spindle à une fréquence
% 
% spindle = cos(2*pi*ft).*env_tot;

% figure;plot(time_tot,spindle);
end





