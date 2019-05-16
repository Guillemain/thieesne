function [u_k,D, completion] = rapiecage_1(bornes_V_p,bornes_V_q_chapeau,u_k,D)
    t = (bornes_V_p(2) - bornes_V_p(1))/2;
    for i = 0:2*t
        for j = 0:2*t
            if (D(bornes_V_p(1)+i, bornes_V_p(3)+j) == 1)
                u_k(bornes_V_p(1)+i, bornes_V_p(3)+j, :) = u_k(bornes_V_q_chapeau(1)+i, bornes_V_q_chapeau(3)+j, :);
                D(bornes_V_p(1)+i, bornes_V_p(3)+j) = 0;
            end
        end
    end
    %completion = sum(sum(D));
end

