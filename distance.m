function [Dis,Dis_coord] = distance(scale,coord1,coord2)
% coord1 坐标1
% coord2 坐标2
% scale 比例尺
Dis_coord = zeros(1,2);
A = coord1(1,2) - coord1(1,1); % 直角边1
Dis_coord(1,1) = floor((coord1(1,2) + coord1(1,1))/2); % 中心点
Dis_coord(1,2) = floor((coord2(1,2) + coord2(1,1))/2);
B = coord2(1,2) - coord2(1,1); % 直角边2
AB = sqrt((A^2)+(B^2)); % 斜边
Dis = AB * scale;
end