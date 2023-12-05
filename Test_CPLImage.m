clc
clear
% 加载net和GTruth
load E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation\XPL\GTruth.mat;
load E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation\Gruth_Train\trainedNet_CPL.mat;
cmap = GTruth.LabelDefinitions.LabelColor;
format='png';% 文件格式
suffix=strcat('.',format);% 文件后缀
SavePathName='E:\TYUT\岩石薄片识别\论文\论文对比图八\';% 文件保存路径

% 原始图像
I1 = imread('E:\TYUT\岩石薄片识别\论文\TraditionalExtract\Test\1_18_2_12.png');figure;imshow(I1)
I2 = imread('E:\TYUT\岩石薄片识别\论文\TraditionalExtract\Test\1_20_3_14.png');figure;imshow(I2)% good
I3 = imread('E:\TYUT\岩石薄片识别\论文\TraditionalExtract\Test\1_28_2_10.png');figure;imshow(I3)
I4 = imread('E:\TYUT\岩石薄片识别\论文\TraditionalExtract\Test\1_48_1_16.png');figure;imshow(I4)
I5 = imread('E:\TYUT\岩石薄片识别\论文\TraditionalExtract\Test\1_49_2_10.png');figure;imshow(I5)
I6 = imread('E:\TYUT\岩石薄片识别\论文\TraditionalExtract\Test\1_55_2_11.png');figure;imshow(I6)
I7 = imread('E:\TYUT\岩石薄片识别\论文\TraditionalExtract\Test\1_18_1_6.png');figure;imshow(I7)
I8 = imread('E:\TYUT\岩石薄片识别\论文\TraditionalExtract\Test\1_18_1_7.png');figure;imshow(I8)
I9 = imread('E:\TYUT\岩石薄片识别\论文\TraditionalExtract\Test\1_18_2_13.png');figure;imshow(I9)

% 测试
C1 = semanticseg(I1, net);
C2 = semanticseg(I2, net);
C3 = semanticseg(I3, net);
C4 = semanticseg(I4, net);
C5 = semanticseg(I5, net);
C6 = semanticseg(I6, net);
C7 = semanticseg(I7, net);
C8 = semanticseg(I8, net);
C9 = semanticseg(I9, net);

% 显示测试之后的图像
B1 = labeloverlay(I1,C1,'ColorMap',cmap,'Transparency',0);figure;imshow(B1)
B2 = labeloverlay(I2,C2,'ColorMap',cmap,'Transparency',0);figure;imshow(B2)
B3 = labeloverlay(I3,C3,'ColorMap',cmap,'Transparency',0);figure;imshow(B3)
B4 = labeloverlay(I4,C4,'ColorMap',cmap,'Transparency',0);figure;imshow(B4)
B5 = labeloverlay(I5,C5,'ColorMap',cmap,'Transparency',0);figure;imshow(B5)
B6 = labeloverlay(I6,C6,'ColorMap',cmap,'Transparency',0);figure;imshow(B6)
B7 = labeloverlay(I7,C7,'ColorMap',cmap,'Transparency',0);figure;imshow(B7)
B8 = labeloverlay(I8,C8,'ColorMap',cmap,'Transparency',0);figure;imshow(B8)
B9 = labeloverlay(I9,C9,'ColorMap',cmap,'Transparency',0);figure;imshow(B9)
x1 = 101; imwrite(B1,strcat(SavePathName,num2str(x1),suffix));
x2 = 102; imwrite(B2,strcat(SavePathName,num2str(x2),suffix));
x3 = 103; imwrite(B3,strcat(SavePathName,num2str(x3),suffix));
x4 = 104; imwrite(B4,strcat(SavePathName,num2str(x4),suffix));
x5 = 105; imwrite(B5,strcat(SavePathName,num2str(x5),suffix));
x6 = 106; imwrite(B6,strcat(SavePathName,num2str(x6),suffix));
x7 = 107; imwrite(B7,strcat(SavePathName,num2str(x7),suffix));
x8 = 108; imwrite(B8,strcat(SavePathName,num2str(x8),suffix));
x9 = 109; imwrite(B9,strcat(SavePathName,num2str(x9),suffix));

% 显示原始标签图像
L1 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation\CPL\Label_224\Label_18_2_12.png');
figure;imshow(L1)
L2 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation\CPL\Label_224\Label_20_3_14.png');
figure;imshow(L2)
L3 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation\CPL\Label_224\Label_28_2_10.png');
figure;imshow(L3)
L4 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation\CPL\Label_224\Label_48_1_16.png');
figure;imshow(L4)
L5 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation\CPL\Label_224\Label_49_2_10.png');
figure;imshow(L5)
L6 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation\CPL\Label_224\Label_55_2_11.png');
figure;imshow(L6)
L7 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation\CPL\Label_224\Label_18_1_6.png');
figure;imshow(L7)
L8 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation\CPL\Label_224\Label_18_1_7.png');
figure;imshow(L8)
L9 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation\CPL\Label_224\Label_18_2_13.png');
figure;imshow(L9)