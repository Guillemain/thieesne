function [u,D_new] = rapiecage_1(BVP,BVQ,u_k,D)
%RAPIECAGE_1 Summary of this function goes here
%   Detailed explanation goes here
patch_D = D(BVP(1,1):BVP(1,2),BVP(2,1):BVP(2,2));
patch = u_k(BVQ(1,1):BVQ(1,2),BVQ(2,1):BVQ(2,2),:);
u = u_k;
for k = 1:3
    patch_temp = patch(:,:,k);
    patch_rempl = u(BVP(1,1):BVP(1,2),BVP(2,1):BVP(2,2),k);
    patch_rempl(patch_D)=patch_temp(patch_D);
    u(BVP(1,1):BVP(1,2),BVP(2,1):BVP(2,2),k) = patch_rempl;
end
D_new = D;
Dpatch = D(BVQ(1,1):BVQ(1,2),BVQ(2,1):BVQ(2,2));
Dpatch(~patch_D)=patch_D(~patch_D);
D_new(BVP(1,1):BVP(1,2),BVP(2,1):BVP(2,2))=Dpatch;

end

