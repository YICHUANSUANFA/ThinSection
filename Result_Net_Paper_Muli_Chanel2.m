clc
clear
% 加载net和GTruth
% I = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\Label_896\Label_18_4.png');
% Image= Test_Image_Color(I);
% imwrite(Image,'E:\TYUT\岩石薄片识别\论文\论文对比图十\Label图8.png');
load E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\GTruth.mat;
load E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\Results\ALL\trainedNet_resnet50.mat;
cmap = GTruth.LabelDefinitions.LabelColor;

A = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\Train_896\1_18_4.png');
B = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\XPL\Train_896\1_18_4.png');
C = Muli_Two_Image(A,B); % 合并为多通道
maxrow = 224;
maxcol = 224;
[C_cell,max_row,max_col]=Muli_Partion(A,B,maxrow,maxcol);
[C2,~,~]=Partion(A,maxrow,maxcol);
Result_Image = cell(max_row,max_col);
B2 = cell(max_row,max_col);

for i =1:max_row
    for j =1:max_col
        Result_Image{i,j} = semanticseg(C_cell{i,j}, net);
        B2{i,j} = labeloverlay(C2{i,j},Result_Image{i,j},'ColorMap',cmap,'Transparency',0);
    end
end
B2 = cell2mat(B2);
figure
imshow(B2)
imwrite(B2,'E:\TYUT\岩石薄片识别\论文\尺寸大小占比\Muli图1.png');