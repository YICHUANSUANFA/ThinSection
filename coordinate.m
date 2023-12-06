function [R_max,R_min,C_max,C_min] = coordinate(R,C)
% [最右端，最左端，最上端，最下端] = coordinate(横坐标集合,纵坐标集合)
R_max = zeros(2,1);
R_min = zeros(2,1);
C_max = zeros(2,1);
C_min = zeros(2,1);

[R_max_R_value] = max(R);
[R_Right,~] = find (R == R_max_R_value);
if (rem(length(R_Right),2)) == 1
    R_max_C_index = R_Right(floor(length(R_Right)/2)+1,1);
else
    R_max_C_index = R_Right(floor(length(R_Right)/2),1);
end
R_max(1,1) = R_max_R_value;
R_max(2,1) = C(R_max_C_index,1);

[R_min_R_value] = min(R);
[R_Left,~] = find (R == R_min_R_value);
if (rem(length(R_Left),2)) == 1
    R_min_C_index = R_Left(floor(length(R_Left)/2)+1,1);
else
    R_min_C_index = R_Left(floor(length(R_Left)/2),1);
end
R_min(1,1) = R_min_R_value;
R_min(2,1) = C(R_min_C_index,1);

[C_max_C_value] = max(C);
[C_Top,~] = find (C == C_max_C_value);
if (rem(length(C_Top),2)) == 1
    C_max_R_index = C_Top(floor(length(C_Top)/2)+1,1);
else
    C_max_R_index = C_Top(floor(length(C_Top)/2),1);
end
C_max(1,1) = R(C_max_R_index,1);
C_max(2,1) = C_max_C_value;

[C_min_C_value] = min(C);
[C_Bottom,~] = find (C == C_min_C_value);
if (rem(length(C_Bottom),2)) == 1
    C_min_R_index = C_Bottom(floor(length(C_Bottom)/2)+1,1);
else
    C_min_R_index = C_Bottom(floor(length(C_Bottom)/2),1);
end
C_min(1,1) = R(C_min_R_index,1);
C_min(2,1) = C_min_C_value;
end