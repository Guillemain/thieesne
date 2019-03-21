function [k,u] = recuit_simule(k_cour,k_nouv,U_cour,U_nouv,T)
k = k_cour;
u = U_cour;
if (U_nouv < U_cour)
   k = k_nouv; 
   u = U_nouv;
else
   if ( rand(1) < exp(-(U_nouv - U_cour)/T))
       k = k_nouv; 
       u = U_nouv;
   end
       
end

