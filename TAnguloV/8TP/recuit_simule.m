function [kmaj,Umaj] = recuit_simule(k_cour,k_nouv,U_cour,U_nouv,T);
%RECUIT_SIMULE Summary of this function goes here
%   Detailed explanation goes here
    if U_nouv < U_cour || rand(1) < exp(-(U_nouv-U_cour)/T)
       kmaj = k_nouv;
       Umaj = U_nouv;       
    else
       kmaj = k_cour;
       Umaj = U_cour;
    end
end

