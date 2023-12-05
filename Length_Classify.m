clc
clear
Dis_statistics = cell2mat(Dis_statistics);
Max_Dis = max(Dis_statistics,[],2);
Min_Dis = min(Dis_statistics,[],2);
Dis_classify = zeros(8,1);
[x,~] = size(Max_Dis);
for i = 1:x
    if (Max_Dis(i,1)/Min_Dis(i,1) < 3) && (Max_Dis(i,1)/Min_Dis(i,1) > 0)
        if ((Max_Dis(i,1) > 10) && (Max_Dis(i,1) < 31.3))
        Dis_classify(1,1) = Dis_classify(1,1) + 1;
        elseif ((Max_Dis(i,1) >= 31.3) && (Max_Dis(i,1) < 62.5))
        Dis_classify(2,1) = Dis_classify(2,1) + 1;
        elseif ((Max_Dis(i,1) >= 62.5) && (Max_Dis(i,1) < 125))
            Dis_classify(3,1) = Dis_classify(3,1) + 1;
        elseif ((Max_Dis(i,1) >= 125) && (Max_Dis(i,1) < 250))
            Dis_classify(4,1) = Dis_classify(4,1) + 1;
        elseif ((Max_Dis(i,1) >= 250) && (Max_Dis(i,1) < 500))
            Dis_classify(5,1) = Dis_classify(5,1) + 1;
        elseif ((Max_Dis(i,1) >= 500) && (Max_Dis(i,1) < 1000))
            Dis_classify(6,1) = Dis_classify(6,1) + 1;
        elseif ((Max_Dis(i,1) >= 1000) && (Max_Dis(i,1) < 2000))
            Dis_classify(7,1) = Dis_classify(7,1) + 1;
        elseif Max_Dis(i,1) >= 2000
            Dis_classify(8,1) = Dis_classify(8,1) + 1;
        end
    end
end