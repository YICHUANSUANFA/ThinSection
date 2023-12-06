function [Dis,Dis_coord] = distance(scale,coord1,coord2)
Dis_coord = zeros(1,2);
A = coord1(1,2) - coord1(1,1);
Dis_coord(1,1) = floor((coord1(1,2) + coord1(1,1))/2);
Dis_coord(1,2) = floor((coord2(1,2) + coord2(1,1))/2);
B = coord2(1,2) - coord2(1,1); 
AB = sqrt((A^2)+(B^2));
Dis = AB * scale;
end