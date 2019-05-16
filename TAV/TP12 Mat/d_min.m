function [existe_q,bornes_V_p,bornes_V_q_chapeau] = d_min(i_p,j_p,u_k,D,t,T)
    
    % Initialisation
    dissemblance_chapeau = Inf; existe_q = 0;
    [nb_lignes,nb_colonnes,nb_canaux] = size(u_k);
    
    % Definition de V_p
    bornes_V_p = [max(i_p-t,1); min(i_p+t,nb_lignes); max(j_p-t,1); min(j_p+t,nb_colonnes)];
    V_p = zeros(nb_lignes,nb_colonnes);
    V_p(bornes_V_p(1):bornes_V_p(2), bornes_V_p(3):bornes_V_p(4)) = 1;
    
    % Définition de R_p
    R_p = V_p.*(~D);
    R_p = R_p(bornes_V_p(1):bornes_V_p(2), bornes_V_p(3):bornes_V_p(4));
    R_p = repmat(R_p,1,1,nb_canaux);
    Completion = [max(0,1-(i_p-t)); max(0,(i_p+t)-nb_lignes); max(0,1-(j_p-t)); max(0,(j_p+t)-nb_colonnes)];
    R_p = [zeros(Completion(1),2*t+1,nb_canaux); R_p];
    R_p = [R_p; zeros(Completion(2),2*t+1,nb_canaux)];
    R_p = [zeros(2*t+1,Completion(3),nb_canaux) R_p];
    R_p = [R_p zeros(2*t+1,Completion(4),nb_canaux)];
    
    % Definition de u_p
    u_p = u_k(bornes_V_p(1):bornes_V_p(2), bornes_V_p(3):bornes_V_p(4), :);
    u_p = [zeros(Completion(1),2*t+1,nb_canaux); u_p];
    u_p = [u_p; zeros(Completion(2),2*t+1,nb_canaux)];
    u_p = [zeros(2*t+1,Completion(3),nb_canaux) u_p];
    u_p = [u_p zeros(2*t+1,Completion(4),nb_canaux)];
    
    % Definition de F_p
    bornes_F_p = [max(i_p-T+t,1+t); min(i_p+T-t,nb_lignes-t); max(j_p-T+t,1+t); min(j_p+T-t,nb_colonnes-t)];
    F_p = zeros(nb_lignes,nb_colonnes);
    F_p(bornes_F_p(1):bornes_F_p(2), bornes_F_p(3):bornes_F_p(4)) = 1;
    
    % Recherche de q_chapeau dans F_p
    for i_q = bornes_F_p(1):bornes_F_p(2)
        for j_q = bornes_F_p(3):bornes_F_p(4)
            
            % Definition de V_q
            bornes_V_q = [max(i_q-t,1); min(i_q+t,nb_lignes); max(j_q-t,1); min(j_q+t,nb_colonnes)];
            V_q = zeros(nb_lignes,nb_colonnes);
            V_q(bornes_V_q(1):bornes_V_q(2), bornes_V_q(3):bornes_V_q(4)) = 1;
            
            if (V_q.*D == zeros(nb_lignes,nb_colonnes))
                % Alors le voisinage de q est inclu dans ~D
                % On se trouve donc bien dans F'(p)
                
                existe_q = 1;
                
                % Definition de u_q
                u_q = u_k(bornes_V_q(1):bornes_V_q(2), bornes_V_q(3):bornes_V_q(4), :);
                
                % Calcule de la dissemblance et maj pour trouver le min
                dissemblance = sum(sum(sum((u_p - R_p.*u_q).^2)));
                if dissemblance < dissemblance_chapeau
                    dissemblance_chapeau = dissemblance;
                    bornes_V_q_chapeau = bornes_V_q ;
                end 
            end
        end
    end
end