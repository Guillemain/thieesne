function AD = attache_donnees(I,mu,sigma_var)
AD = zeros(size(I,1),size(I,2),size(mu,2));
for q = 1:size(mu,2)
    for i = 1:size(I,1)
        for j = 1:size(I,2)
            pixel = I(i,j,:);
            pixel = pixel(:);
            AD(i,j,q) = log(det(sigma_var(:,:,q))) + 0.5* ((pixel - mu(:,q))' * sigma_var(:,:,q)^-1 * (pixel - mu(:,q)) );
        end
    end
end
end