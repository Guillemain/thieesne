function params_MV2 = MV_2( D_app,parametres_test,sigma )
%MV_2 Summary of this function goes here
%   Detailed explanation goes here
    nb_param = size(parametres_test,1);
    LV2 = zeros(nb_param,1);
    pi1 = 0.5;
    pi2= 0.5;
    
    for i = 1:nb_param
        r1 = calcul_r(D_app,parametres_test(i,1,:));
        r2 = calcul_r(D_app,parametres_test(i,2,:));
        p1 = (pi1/sigma)*exp((-1/(2*sigma^2))*(r1.^2));
        p2 = (pi2/sigma)*exp((-1/(2*sigma^2))*(r2.^2));
        LV2(i) = sum(log(p1+p2));
    end
    
    [~,ind] = max(LV2,[],1);
    params_MV2 = parametres_test(ind,:,:);
end

