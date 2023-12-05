% 计算图片中各类矿物组分的占比
clc
clear
A = imread('E:\TYUT\岩石薄片识别\论文\尺寸大小占比\CPL图1.png');
A = rgb2gray(A);
pixel_num = zeros(1,14);
[x,y] = size(A);
for i = 1:x
    for j = 1:y
        if A(i,j) == 94 % 石英
            pixel_num(1,1) = pixel_num(1,1) + 1;
        elseif A(i,j) == 116 % 长石
            pixel_num(1,2) = pixel_num(1,2) + 1;
        elseif A(i,j) == 178 % 岩屑
            pixel_num(1,3) = pixel_num(1,3) + 1;
        elseif A(i,j) == 142 % 黑云母
            pixel_num(1,4) = pixel_num(1,4) + 1;
        elseif A(i,j) == 125 % 白云母
            pixel_num(1,5) = pixel_num(1,5) + 1;
        elseif A(i,j) == 173 % 红色铸体
            pixel_num(1,6) = pixel_num(1,6) + 1;
        elseif A(i,j) == 228 % 黄色铸体
            pixel_num(1,7) = pixel_num(1,7) + 1;
        elseif A(i,j) == 240 % 磁铁矿
            pixel_num(1,8) = pixel_num(1,8) + 1;
%         elseif A(i,j) == 90 % 杂基
%             pixel_num(1,9) = pixel_num(1,9) + 1;
        elseif ((A(i,j) == 192)||(A(i,j) == 191)) % 隧石
            pixel_num(1,9) = pixel_num(1,9) + 1;
        elseif A(i,j) == 176 % 菱铁矿
            pixel_num(1,10) = pixel_num(1,10) + 1;
%         elseif A(i,j) == 0 % 岩屑2
%             pixel_num(1,12) = pixel_num(1,12) + 1;
        elseif A(i,j) == 139 % 比例尺100
            pixel_num(1,11) = pixel_num(1,11) + 1;
        elseif A(i,j) == 66 % 比例尺200
            pixel_num(1,12) = pixel_num(1,12) + 1;
        elseif A(i,j) == 29 % 比例尺50
            pixel_num(1,13) = pixel_num(1,13) + 1;
        elseif A(i,j) == 76 % 海绿石
            pixel_num(1,14) = pixel_num(1,14) + 1;
        end
    end
end