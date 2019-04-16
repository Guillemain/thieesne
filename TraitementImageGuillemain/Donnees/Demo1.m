function [M,T] = Demo1(file,K)
subplot(2, 2, 1);
im = imread(file);
image(im);
hold on
subplot(2, 2, 2);

[A,c] = SpxSLIC(double(im),K);

B = visualiseSPX(im,A,c)

image(uint8(B));
subplot(2,2,3);

[i,M,T] = binariseIM(im,A,c);

image(M)
end