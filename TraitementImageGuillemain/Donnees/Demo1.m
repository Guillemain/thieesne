function [M,Mnb,T] = Demo1(file,K)
im = imread(file);
subplot(2,2,1);
image(im);
hold on
subplot(2, 2, 2);

im = medfilt3(im); %% Pour eviter le bruit de du dino
image(im);

subplot(2, 2, 3);

[A,c] = SpxSLIC(double(im),K);

B = visualiseSPX(im,A,c);

image(uint8(B));
subplot(2,2,4);

[~,M,Mnb,T] = binariseIM(im,A,c);

image(M)
end