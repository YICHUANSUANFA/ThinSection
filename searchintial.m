%3.搜索样本空间初始聚类中心
function C=searchintial(X,method,varargin)
    switch lower (method(1))
        case 's'
            k=varargin{1};
            C=X(randsample(size(X,1),k),:);
        case 'u'
            Xmins=min(X,[],1);
            Xmaxs=max(X,[],1);
            k=varargin{1};
            C=unifrnd(Xmins(ones(k,1),:),Xmaxs(ones(k,1),:));
    end