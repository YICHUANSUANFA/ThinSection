% 图像测试拼接
clc
clear
% 加载net和GTruth
load E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\GTruth.mat;
load E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\Final_trainedNet_resnet50.mat;
cmap = GTruth.LabelDefinitions.LabelColor;

% load E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\Results\MuliImageSS_ResNet50_ParallelClass_ResAttention\trainedNet_resnet50.mat;
% Muli_I1 = load('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\NET_Muli_CPL_XPL_All\NET_Muli_CPL_XPL\1_55_2_11.mat');
% A1 = mat_matrix(Muli_I1);
% I1 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\Train_224\1_55_2_11.png');
% C1 = semanticseg(A1, net);
% B = labeloverlay(I1,C1,'ColorMap',cmap,'Transparency',0);
% imshow(B)

A = imread('E:\TYUT\岩石薄片识别\论文\论文对比图九\1_18_4.png');
maxrow = 224;
maxcol = 224;
[C,max_row,max_col] = Partion(A,maxrow,maxcol);
Result_Image = cell(max_row,max_col);
B = cell(max_row,max_col);

% 原始图像
I1 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\Train_224\1_18_4_1.png');
I2 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\Train_224\1_18_4_1.png');
I3 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\Train_224\1_18_4_3.png');
I4 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\Train_224\1_18_4_4.png');
I5 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\Train_224\1_18_4_5.png');
I6 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\Train_224\1_18_4_6.png');
I7 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\Train_224\1_18_4_7.png');
I8 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\Train_224\1_18_4_8.png');
I9 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\Train_224\1_18_4_9.png');
I10 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\Train_224\1_18_4_10.png');
I11 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\Train_224\1_18_4_11.png');
I12 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\Train_224\1_18_4_12.png');
I13 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\Train_224\1_18_4_13.png');
I14 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\Train_224\1_18_4_14.png');
I15 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\Train_224\1_18_4_15.png');
I16 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\Train_224\1_18_4_16.png');

% 原始多光谱图像
Muli_I1 = load('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\NET_Muli_CPL_XPL_All\NET_Muli_CPL_XPL\1_18_4_1.mat');
A1 = mat_matrix(Muli_I1);
Muli_I2 = load('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\NET_Muli_CPL_XPL\1_18_4_2.mat');
A2 = mat_matrix(Muli_I2);
Muli_I3 = load('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\NET_Muli_CPL_XPL\1_18_4_3.mat');
A3 = mat_matrix(Muli_I3);
Muli_I4 = load('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\NET_Muli_CPL_XPL\1_18_4_4.mat');
A4 = mat_matrix(Muli_I4);
Muli_I5 = load('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\NET_Muli_CPL_XPL\1_18_4_5.mat');
A5 = mat_matrix(Muli_I5);
Muli_I6 = load('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\NET_Muli_CPL_XPL\1_18_4_6.mat');
A6 = mat_matrix(Muli_I6);
Muli_I7 = load('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\NET_Muli_CPL_XPL\1_18_4_7.mat');
A7 = mat_matrix(Muli_I7);
Muli_I8 = load('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\NET_Muli_CPL_XPL\1_18_4_8.mat');
A8 = mat_matrix(Muli_I8);
Muli_I9 = load('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\NET_Muli_CPL_XPL\1_18_4_9.mat');
A9 = mat_matrix(Muli_I9);
Muli_I10 = load('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\NET_Muli_CPL_XPL\1_18_4_10.mat');
A10 = mat_matrix(Muli_I10);
Muli_I11 = load('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\NET_Muli_CPL_XPL\1_18_4_11.mat');
A11 = mat_matrix(Muli_I11);
Muli_I12 = load('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\NET_Muli_CPL_XPL\1_18_4_12.mat');
A12 = mat_matrix(Muli_I12);
Muli_I13 = load('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\NET_Muli_CPL_XPL\1_18_4_13.mat');
A13 = mat_matrix(Muli_I13);
Muli_I14 = load('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\NET_Muli_CPL_XPL\1_18_4_14.mat');
A14 = mat_matrix(Muli_I14);
Muli_I15 = load('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\NET_Muli_CPL_XPL\1_18_4_15.mat');
A15 = mat_matrix(Muli_I15);
Muli_I16 = load('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\NET_Muli_CPL_XPL\1_18_4_16.mat');
A16 = mat_matrix(Muli_I16);


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
C10 = semanticseg(A10, net);
C11 = semanticseg(A11, net);
C12 = semanticseg(A12, net);
C13 = semanticseg(A13, net);
C14 = semanticseg(A14, net);
C15 = semanticseg(A15, net);
C16 = semanticseg(A16, net);

% 显示测试之后的图像
B{1,1} = labeloverlay(I1,C1,'ColorMap',cmap,'Transparency',0);
B{1,2} = labeloverlay(I2,C2,'ColorMap',cmap,'Transparency',0);
B{1,3} = labeloverlay(I3,C3,'ColorMap',cmap,'Transparency',0);
B{1,4} = labeloverlay(I4,C4,'ColorMap',cmap,'Transparency',0);
B{2,1} = labeloverlay(I5,C5,'ColorMap',cmap,'Transparency',0);
B{2,2} = labeloverlay(I6,C6,'ColorMap',cmap,'Transparency',0);
B{2,3} = labeloverlay(I7,C7,'ColorMap',cmap,'Transparency',0);
B{2,4} = labeloverlay(I8,C8,'ColorMap',cmap,'Transparency',0);
B{3,1} = labeloverlay(I9,C9,'ColorMap',cmap,'Transparency',0);
B{3,2} = labeloverlay(I10,C10,'ColorMap',cmap,'Transparency',0);
B{3,3} = labeloverlay(I11,C11,'ColorMap',cmap,'Transparency',0);
B{3,4} = labeloverlay(I12,C12,'ColorMap',cmap,'Transparency',0);
B{4,1} = labeloverlay(I13,C13,'ColorMap',cmap,'Transparency',0);
B{4,2} = labeloverlay(I14,C14,'ColorMap',cmap,'Transparency',0);
B{4,3} = labeloverlay(I15,C15,'ColorMap',cmap,'Transparency',0);
B{4,4} = labeloverlay(I16,C16,'ColorMap',cmap,'Transparency',0);




% pixelLabelColorbar(cmap,classNames);