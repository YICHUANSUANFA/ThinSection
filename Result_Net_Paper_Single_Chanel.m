clc
clear
% 加载net和GTruth
% I = imread('E:\TYUT\岩石薄片识别\论文\论文对比图九\1_18_4_16.png');
% [Left_Scale,Right_Scale] = Scale_Calculation(I,net,cmap)
load E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\XPL\GTruth.mat;
load E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\XPL\Final_trainedNet_XPL.mat;

% load E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\XPL\GTruth_Revolve_1433.mat;
% load E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\Results\XPL_ResNet50_No_Attention\trainedNet_resnet50.mat;
% load E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\XPL\GTruth_Revolve_1433.mat;
% load E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\Results\XPL_ResNet50_No_Attention\trainedNet_resnet50.mat;
cmap = GTruth.LabelDefinitions.LabelColor;

% A = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\XPL\Train_896\1_18_4.png');
A = imread('E:\TYUT\岩石薄片识别\论文\多通道语义分割效果图\XPL\1_48_1_16.png');

maxrow = 224;
maxcol = 224;
[C,max_row,max_col] = Partion(A,maxrow,maxcol);
Result_Image = cell(max_row,max_col);
B = cell(max_row,max_col);

for i =1:max_row
    for j =1:max_col
        Result_Image{i,j} = semanticseg(C{i,j}, net);
        B{i,j} = labeloverlay(C{i,j},Result_Image{i,j},'ColorMap',cmap,'Transparency',0);
    end
end
B = cell2mat(B);
% figure
% imshow(B)
% imwrite(B,'E:\TYUT\岩石薄片识别\论文\尺寸大小占比\XPL图1.png');
% imwrite(B,'E:\TYUT\岩石薄片识别\论文\尺寸大小占比\CPL图1.png');
% imwrite(B,'E:\TYUT\岩石薄片识别\论文\多通道语义分割效果图\XPL\XPL图1.png');
% imwrite(B,'E:\TYUT\岩石薄片识别\论文\效果对比图\CPL_XPL_MULI\A_Test_CPL_NoAttention\Single图1.png');