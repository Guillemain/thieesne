function contour = detection_contour(BW)
    [n,m] = size(BW);
    for i = 1:n
        for j = 1:m
            if BW(i,j) ~=0
                contour = bwtraceboundary(BW,[i j],'S');
                contour = contour(1:5:end,:);
                hold on;
                plot(contour(:,2),contour(:,1),'-g');
                hold off;
                return
            end
        end
    end
    contour = NaN;
end