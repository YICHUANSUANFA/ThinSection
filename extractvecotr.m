%2.��ȡ��������
function vec=extractvecotr(img)
[m,n,~]=size(img);
vec=zeros(m*n,3);
img=double(img); 
for j=1:n
    for i=1:m
        %��ȡ��ɫ����
        color=img(i,j,:);
        %��ȡ��������
        wx=1;wy=1;
        dist=[wx*j/n,wy*i/m];
        dist=[];
        %��ȡ��������
        texture=[];
        %�����������
        vec((j-1)*m+i,:)=[color(:);dist(:);texture(:)];
    end
end