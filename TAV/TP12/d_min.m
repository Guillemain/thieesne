function [existe_q,bornes_V_p,bornes_V_q_chapeau] = d_min(i_p,j_p,u_k,D,t,T)

[i_u_max,j_u_max,~] = size(u_k);
bornes_V_p = [max(i_p-t,0),min(i_p+t,i_u_max);max(0,j_p-t),min(j_p+t,j_u_max)];
existe_q = true;
bornes_V_q_chapeau =[];

patch_p = u_k(max(i_p-t,0):min(i_p+t,i_u_max) , max(0,j_p-t):min(j_p+t,j_u_max),:); %La fenêtre sur p;
patch_D_p = D(max(i_p-t,0):min(i_p+t,i_u_max) , max(0,j_p-t):min(j_p+t,j_u_max));
non_patch_D_p = ~patch_D_p;
cardinal = sum(sum(non_patch_D_p));
d_mini = inf;

for i = max(i_p-T,0):min(i_p+T,i_u_max)
    for j = max(0,j_p-T):min(j_p+T,j_u_max)
 
        patch_D = D(max(i-t,0):min(i+t,i_u_max) , max(0,j-t):min(j+t,j_u_max));
        
        if(size(patch_D) == size(patch_D_p))
            if(sum(sum( patch_D - patch_D_p )) <= 0)
                patch = u_k(max(i-t,0):min(i+t,i_u_max) , max(0,j-t):min(j+t,j_u_max),:);
                d = 0;
                for k = 1:3
                    temp_patch = patch(:,:,k);
                    temp_patch_p = patch_p(:,:,k);
                    d = d+sum((temp_patch(non_patch_D_p) - temp_patch_p(non_patch_D_p)).^2);
                end
                %d = 1/cardinal * d; %Finalement pas utile car simple terme
                %de régularisation.
                if (d < d_mini)
                    d_mini = d;
                    bornes_V_q_chapeau = [max(i-t,0),min(i+t,i_u_max);max(0,j-t),min(j+t,j_u_max)];
                    existe_q = false;
                end
            end
        end
    end
end
end

