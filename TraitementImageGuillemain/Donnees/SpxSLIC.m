function Msq = SpxSLIC(I,K)
%
%

    
end

function G = derivees(I)
kernel_Sobel_y =   0.25*[1 2 1;
            0 0 0;
           -1 -2 -1];
kernel_Sobel_x = 0.25*[1 0 -1;
                       2 0 -2;
                       1 0 -1];
       
Gx = conv(I,kernel_Sobel_x,'same');
Gy = conv(I,kernel_Sobel_y,'same');

G = sqrt(Gx.^2 + Gy^2);
    
end