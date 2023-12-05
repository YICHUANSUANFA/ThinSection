function [R_Dis_statistics,C_Dis_statistics] = Length_statistics(A)
% A应当为测试所需的label图
scale = 1.226994;
[x,y] = size(A);
for i = 1:x
    for j = 1:y
        if A(i,j) == 94
%         if A(i,j) == 1
            A(i,j) = 255;
        else
            A(i,j) = 0;
        end
    end
end
[L,N] = bwlabel(A,8);
R = cell(N,1);% 横坐标
C = cell(N,1);% 纵坐标
R_max = cell(N,1);
R_min = cell(N,1);
C_max = cell(N,1);
C_min = cell(N,1);
R_Dis = cell(N,2); % 横向长度
C_Dis = cell(N,2); % 纵向长度
R_Dis_R = zeros(1,N);
R_Dis_C = zeros(1,N);
C_Dis_R = zeros(1,N);
C_Dis_C = zeros(1,N);
suffix = cell(1,N);
R_coordinate = cell(N,2); % 纵向所有坐标值
C_coordinate = cell(N,2); % 横向所有坐标值
% LenRadAng=cell(N,1);%参数的细胞
for k=1:N
    [R{k,1},C{k,1}] = find (L == k);%找到上面的封闭区域的元素
end
for k = 1:N
    [R_max{k,1},R_min{k,1},C_max{k,1},C_min{k,1}] = coordinate(R{k,1},C{k,1});
end
for k = 1:N
    R_coordinate{k,1} = [R_min{k,1}(1,1) R_max{k,1}(1,1)];
    R_coordinate{k,2} = [R_min{k,1}(2,1) R_max{k,1}(2,1)];
    C_coordinate{k,1} = [C_min{k,1}(1,1) C_max{k,1}(1,1)];
    C_coordinate{k,2} = [C_min{k,1}(2,1) C_max{k,1}(2,1)];
end
for k = 1:N
    [R_Dis{k,1},R_Dis{k,2}] = distance(scale,R_coordinate{k,1},R_coordinate{k,2});
    [C_Dis{k,1},C_Dis{k,2}] = distance(scale,C_coordinate{k,1},C_coordinate{k,2});
end
for k = 1:N
%     A=bitmapplot(R_coordinate{k,1},R_coordinate{k,2},A,struct('LineWidth',5));
    A=bitmapplot(C_coordinate{k,1},C_coordinate{k,2},A,struct('LineWidth',5));
end
for k = 1:N
    R_Dis_R(1,k) = R_Dis{k,2}(1,1);
    R_Dis_C(1,k) = R_Dis{k,2}(1,2);
    C_Dis_R(1,k) = C_Dis{k,2}(1,1);
    C_Dis_C(1,k) = C_Dis{k,2}(1,2);
end
[x_R_Dis,y_R_Dis] = size(R_Dis);
if ((x_R_Dis == 0) || (y_R_Dis == 0))
    R_Dis_statistics = 0;
    C_Dis_statistics = 0;
else
    R_Dis = cell2mat(R_Dis);
    R_Dis_statistics = R_Dis(:,1);
    C_Dis = cell2mat(C_Dis);
    C_Dis_statistics = C_Dis(:,1);
end
end