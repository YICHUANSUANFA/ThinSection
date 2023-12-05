%2.提取特征向量
function vec=extractvecotr(img)
[m,n,~]=size(img);
vec=zeros(m*n,3);
img=double(img); 
for j=1:n
    for i=1:m
        %提取颜色特征
        color=img(i,j,:);
        %提取距离特征
        wx=1;wy=1;
        dist=[wx*j/n,wy*i/m];
        dist=[];
        %提取纹理特征
        texture=[];
        %组成特征向量
        vec((j-1)*m+i,:)=[color(:);dist(:);texture(:)];
    end
end