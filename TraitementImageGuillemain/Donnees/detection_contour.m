function contour = detection_contour(BW)
    [n,m] = size(BW);
    for i = 1:n
        for j = 1:m
            if BW(i,j) > 125
                contour = bwtraceboundary(BW,[i j],'S');
                return
            end
        end
    end
    contour = Nan;
end