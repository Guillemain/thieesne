function params_MV = MV( D_app,parametres_test )
%MV Summary of this function goes here
%   Detailed explanation goes here
    nb_param = size(parametres_test,1);
    LV = zeros(nb_param,1);
    for i = 1:nb_param
        r = calcul_r(D_app,parametres_test(i,:));
        LV(i) = sum(r.^2);
    end
    
    [~,ind] = min(LV,[],1);
    params_MV = parametres_test(ind,:);
end

