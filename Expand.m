function [EX] = Expand(B)
%B����Ҫ����ľ���
%EX������֮��ľ���
[x,y]=size(B);
EX=zeros(x+4,y+4);%Expand�ľ�������ԭ����
for i=1:x
    for j=1:y
        EX(i+2,j+2)=B(i,j);
    end
end
for i=1:2
    for j=1:y
        EX(i,j+2)=B(i,j);%���Ͼ���
    end
end
for i=x+3:x+4
    for j=1:y
        EX(i,j+2)=B(i-4,j);%���¾���������λ
    end
end
for j=1:2
    for i=1:x+4
        EX(i,j)=EX(i,j+2);%������
    end
end
for j=y+3:y+4
    for i=1:x+4
        EX(i,j)=EX(i,j-2);%���Ҿ���
    end
end
EX=uint8(EX);
end