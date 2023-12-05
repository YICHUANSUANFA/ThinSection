% 1.��������֮�����
function D=sampledist(X,C,method)
[n,p]=size(X);
k=size(C,1);
D=zeros(n,k);
switch lower(method(1))
    case 'e' %euclidean��ŷ�Ͼ���
        for i=1:k
            D(:,i)=(X(:,1)-C(i,1)).^2;
            for j=2:p
                D(:,i)=D(:,i)+(X(:,j)-C(i,j)).^2;
            end
        end
    case 'c' %cityblock�����о���
        for i=1:k
            D(:,i)=abs(X(:,1)-C(i,1));
            for j=2:p
                D(:,i)=D(:,i)+abs(X(:,j)-C(i,j));
            end
        end
        
end