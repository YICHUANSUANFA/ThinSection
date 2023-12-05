function [C,max_row,max_col]=Muli_Partion(A,B,maxrow,maxcol)
% 区域分块函数
% C是将A裁剪后的细胞
% C1和C2是和C一样大小的细胞，细胞中每个组织的大小是maxrow*maxcol
[x,y,~]=size(A);%求矩阵的行数和列数
max_row = floor(x/maxrow);
max_col = floor(y/maxcol);
C = cell(max_row,max_col);
C1 = cell(max_row,max_col);
C2 = cell(max_row,max_col);
for i=1:max_row
    for j=1:max_col
        C{i,j}=zeros(maxrow,maxcol);
    end
end
for i=1:max_row
    for j=1:max_col
        C1{j,i}=imcrop(A,[(i-1)*maxrow+1,(j-1)*maxcol+1,maxrow-1,maxcol-1]);%裁剪
    end
end
for i=1:max_row
    for j=1:max_col
        C2{j,i}=imcrop(B,[(i-1)*maxrow+1,(j-1)*maxcol+1,maxrow-1,maxcol-1]);%裁剪
    end
end
for i=1:max_row
    for j=1:max_col
        C{i,j} = Muli_Two_Image(C1{i,j},C2{i,j});
    end
end
end