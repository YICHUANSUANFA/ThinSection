function [EX] = Expand(B)
%B是需要扩大的矩阵
%EX是扩大之后的矩阵
[x,y]=size(B);
EX=zeros(x+4,y+4);%Expand的矩阵，扩大原矩阵
for i=1:x
    for j=1:y
        EX(i+2,j+2)=B(i,j);
    end
end
for i=1:2
    for j=1:y
        EX(i,j+2)=B(i,j);%向上镜像
    end
end
for i=x+3:x+4
    for j=1:y
        EX(i,j+2)=B(i-4,j);%向下镜像两个单位
    end
end
for j=1:2
    for i=1:x+4
        EX(i,j)=EX(i,j+2);%向左镜像
    end
end
for j=y+3:y+4
    for i=1:x+4
        EX(i,j)=EX(i,j-2);%向右镜像
    end
end
EX=uint8(EX);
end