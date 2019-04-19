function [ output_args ] = Demo2(file,K)
%DEMO2 Summary of this function goes here
%   Detailed explanation goes here
close all;
[M,Mnb,~] = Demo1(file,K);

contour = detection_contour(Mnb);
squelette = estimation_squelette(Mnb,contour);

end

