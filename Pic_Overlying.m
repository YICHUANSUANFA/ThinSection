function A = Pic_Overlying(A,B)
% A 原始图片 
% B 比例尺图片
% 盒8
x = 960;
y = 800;
for i = 960:1000
    for j = 800:969
        A(i,j,1) = B(i-x+1,j-y+1,1);
        A(i,j,2) = B(i-x+1,j-y+1,2);
        A(i,j,3) = B(i-x+1,j-y+1,3);
    end
end
% 大宁
% x = 800;
% y = 690;
% for i = 800:840
%     for j = 690:859
%         A(i,j,1) = B(i-x+1,j-y+1,1);
%         A(i,j,2) = B(i-x+1,j-y+1,2);
%         A(i,j,3) = B(i-x+1,j-y+1,3);
%     end
% end
end