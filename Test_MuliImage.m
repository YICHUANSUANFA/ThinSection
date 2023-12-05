clc
clear
% 加载net和GTruth
load E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\GTruth.mat;
load E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\trainedNet_resnet50.mat;
cmap = GTruth.LabelDefinitions.LabelColor;
format='png';% 文件格式
suffix=strcat('.',format);% 文件后缀
SavePathName='E:\TYUT\岩石薄片识别\论文\TraditionalExtract\Test\';% 文件保存路径

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

% 原始多光谱图像
Muli_I1 = load('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\NET_Muli_CPL_XPL\1_18_2_12.mat');
A1 = mat_matrix(Muli_I1);
Muli_I2 = load('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\NET_Muli_CPL_XPL\1_20_3_14.mat');
A2 = mat_matrix(Muli_I2);
Muli_I3 = load('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\NET_Muli_CPL_XPL\1_28_2_10.mat');
A3 = mat_matrix(Muli_I3);
Muli_I4 = load('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\NET_Muli_CPL_XPL\1_48_1_16.mat');
A4 = mat_matrix(Muli_I4);
Muli_I5 = load('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\NET_Muli_CPL_XPL\1_49_2_10.mat');
A5 = mat_matrix(Muli_I5);
Muli_I6 = load('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\NET_Muli_CPL_XPL\1_55_2_11.mat');
A6 = mat_matrix(Muli_I6);
Muli_I7 = load('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\NET_Muli_CPL_XPL\1_18_1_6.mat');
A7 = mat_matrix(Muli_I7);
Muli_I8 = load('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\NET_Muli_CPL_XPL\1_18_1_7.mat');
A8 = mat_matrix(Muli_I8);
Muli_I9 = load('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\NET_Muli_CPL_XPL\1_18_2_13.mat');
A9 = mat_matrix(Muli_I9);

% 测试
C1 = semanticseg(A1, net);
C2 = semanticseg(A2, net);
C3 = semanticseg(A3, net);
C4 = semanticseg(A4, net);
C5 = semanticseg(A5, net);
C6 = semanticseg(A6, net);
C7 = semanticseg(A7, net);
C8 = semanticseg(A8, net);
C9 = semanticseg(A9, net);

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
x1 = 11; imwrite(B1,strcat(SavePathName,num2str(x1),suffix));
x2 = 12; imwrite(B2,strcat(SavePathName,num2str(x2),suffix));
x3 = 13; imwrite(B3,strcat(SavePathName,num2str(x3),suffix));
x4 = 14; imwrite(B4,strcat(SavePathName,num2str(x4),suffix));
x5 = 15; imwrite(B5,strcat(SavePathName,num2str(x5),suffix));
x6 = 16; imwrite(B6,strcat(SavePathName,num2str(x6),suffix));
x7 = 17; imwrite(B7,strcat(SavePathName,num2str(x7),suffix));
x8 = 18; imwrite(B8,strcat(SavePathName,num2str(x8),suffix));
x9 = 19; imwrite(B9,strcat(SavePathName,num2str(x9),suffix));

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