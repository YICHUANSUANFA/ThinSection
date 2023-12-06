function Image= Test_Image_Color(I)
[x,y] = size(I);
Image = zeros(x,y,3);
for i = 1:x
    for j = 1:y
        if I(i,j) == 1
            Image(i,j,1) = 0;
            Image(i,j,2) = 0.4824;
            Image(i,j,3) = 0.7412;
        elseif I(i,j) == 2
            Image(i,j,1) = 0.8500;
            Image(i,j,2) = 0.3250;
            Image(i,j,3) = 0.0980;
        elseif I(i,j) == 3
            Image(i,j,1) = 0.9290;
            Image(i,j,2) = 0.6940;
            Image(i,j,3) = 0.1250;
        elseif I(i,j) == 4
            Image(i,j,1) = 0.4667;
            Image(i,j,2) = 0.6745;
            Image(i,j,3) = 0.1882;
        elseif I(i,j) == 5
            Image(i,j,1) = 0.7176;
            Image(i,j,2) = 0.2745;
            Image(i,j,3) = 1;
        elseif I(i,j) == 6
            Image(i,j,1) = 0;
            Image(i,j,2) = 1;
            Image(i,j,3) = 0.8157;
        elseif I(i,j) == 7
            Image(i,j,1) = 1;
            Image(i,j,2) = 1;
            Image(i,j,3) = 0.0667;
        elseif I(i,j) == 8
            Image(i,j,1) = 0.9412;
            Image(i,j,2) = 0.9412;
            Image(i,j,3) = 0.9412;
        elseif I(i,j) == 9
            Image(i,j,1) = 0.4118;
            Image(i,j,2) = 0.3882;
            Image(i,j,3) = 0.0078;
        elseif I(i,j) == 10
            Image(i,j,1) = 0.5765;
            Image(i,j,2) = 0.9882;
            Image(i,j,3) = 0;
        elseif I(i,j) == 11
            Image(i,j,1) = 1;
            Image(i,j,2) = 0.5412;
            Image(i,j,3) = 0.6549;
        elseif I(i,j) == 12
            Image(i,j,1) = 0;
            Image(i,j,2) = 0;
            Image(i,j,3) = 0;
        elseif I(i,j) == 13
            Image(i,j,1) = 0.6078;
            Image(i,j,2) = 0.6196;
            Image(i,j,3) = 0.0078;
        elseif I(i,j) == 14
            Image(i,j,1) = 0.6353;
            Image(i,j,2) = 0.0784;
            Image(i,j,3) = 0.1843;
        elseif I(i,j) == 15
            Image(i,j,1) = 0;
            Image(i,j,2) = 0;
            Image(i,j,3) = 1;
        elseif I(i,j) == 16
            Image(i,j,1) = 1;
            Image(i,j,2) = 0;
            Image(i,j,3) = 0;
        end
    end
end
end