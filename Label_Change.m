function Label_A = Label_Change(A)
% 将语义分割图像转为Label图
Label_A = A;
Label_A = rgb2gray(Label_A);
[x,y] = size(Label_A);
for i = 1:x
    for j = 1:y
        if Label_A(i,j) == 94 % 石英
            Label_A(i,j) = 1;
        elseif Label_A(i,j) == 116 % 长石
            Label_A(i,j) = 2;
        elseif Label_A(i,j) == 178 % 岩屑
            Label_A(i,j) = 3;
        elseif Label_A(i,j) == 142 % 黑云母
            Label_A(i,j) = 4;
        elseif Label_A(i,j) == 125 % 白云母
            Label_A(i,j) = 5;
        elseif Label_A(i,j) == 173 % 红色铸体
            Label_A(i,j) = 6;
        elseif Label_A(i,j) == 228 % 黄色铸体
            Label_A(i,j) = 7;
        elseif Label_A(i,j) == 240 % 磁铁矿
            Label_A(i,j) = 8;
%         elseif A(i,j) == 90 % 杂基
%             pixel_num(1,9) = pixel_num(1,9) + 1;
        elseif ((Label_A(i,j) == 192)||(Label_A(i,j) == 191)) % 隧石
            Label_A(i,j) = 9;
        elseif Label_A(i,j) == 176 % 菱铁矿
            Label_A(i,j) = 10;
%         elseif A(i,j) == 0 % 岩屑2
%             pixel_num(1,12) = pixel_num(1,12) + 1;
        elseif Label_A(i,j) == 139 % 比例尺100
            Label_A(i,j) = 11;
        elseif Label_A(i,j) == 66 % 比例尺200
            Label_A(i,j) = 12;
        elseif Label_A(i,j) == 29 % 比例尺50
            Label_A(i,j) = 13;
        elseif Label_A(i,j) == 76 % 海绿石
            Label_A(i,j) = 14;
        end
    end
end
end