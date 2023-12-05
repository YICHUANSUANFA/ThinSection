function [Left_Scale,Right_Scale] = Scale_Calculation(I,Neural_Net,cmap)
A = I;
C = semanticseg(I, Neural_Net);
B = labeloverlay(I,C,'ColorMap',cmap,'Transparency',0);
figure;imshow(B)
[x,y,~] = size(B);
for i = 1:x
    for j = 1:y
        if ((B(i,j,1) == 162) && (B(i,j,2) == 20) && (B(i,j,3) == 47))
            B(i,j,1) = B(i,j,1);
            B(i,j,2) = B(i,j,2);
            B(i,j,3) = B(i,j,3);
        else
            A(i,j,1) = 255;
            A(i,j,2) = 255;
            A(i,j,3) = 255;
        end
    end
end
A = rgb2gray(A);
A = imbinarize(A);
A = uint8(A);
EX_A = Expand(A);
Coordinate = []; % 存储比例尺终端坐标
num = 1;
for i = 3:x+2
    for j = 3:y+2
        if (EX_A(i,j) == 0)
            Conv_A = EX_A(i-1,j-1) + EX_A(i-1,j) + EX_A(i-1,j+1) + EX_A(i,j-1) + EX_A(i,j) + EX_A(i,j+1) + EX_A(i+1,j-1) + EX_A(i+1,j) + EX_A(i+1,j+1);
%             Conv_A_Nine = EX_A(i-1,j-1) + EX_A(i-1,j) + EX_A(i-1,j+1) + EX_A(i,j-1) + EX_A(i,j) + EX_A(i,j+1) + EX_A(i+1,j-1) + EX_A(i+1,j) + EX_A(i+1,j+1);
%             if (Conv_A >= 6) || (Conv_A_Nine == 9)
%                 EX_A(i,j) = 1;
%             end
            if Conv_A == 5
                Coordinate(num,1) = i;
                Coordinate(num,2) = j;
                num = num + 1;
%             else
%                 EX_A(i,j) = 1;
            end
        end
    end
end
Left_Scale = min(Coordinate(:,2));
Right_Scale = max(Coordinate(:,2));
rect=[3 3 223 223]; % 区域1
Pic = imcrop(EX_A,rect);
Pic = uint8(255.*Pic);
figure;imshow(Pic,[])
end