function SemSegPic_ThinSection = MainFunc_ThinSections(A,B)
load E:\SemanticSegmentation_Scale\CPL\GTruth.mat;
load E:\trainedNet_resnet50.mat;
cmap = GTruth.LabelDefinitions.LabelColor;

% A = imread('E:\SemanticSegmentation_Scale\CPL\Train_896\1_18_4.png');
% B = imread('E:\SemanticSegmentation_Scale\XPL\Train_896\1_18_4.png');
C = Muli_Two_Image(A,B); % 合并为多通道
maxrow = 224;
maxcol = 224;
[C_cell,max_row,max_col]=Muli_Partion(A,B,maxrow,maxcol);
[C2,~,~]=Partion(A,maxrow,maxcol);
Result_Image = cell(max_row,max_col);
SemSegPic_ThinSection = cell(max_row,max_col);% 语义分割图像

for i =1:max_row
    for j =1:max_col
        Result_Image{i,j} = semanticseg(C_cell{i,j}, net);
        SemSegPic_ThinSection{i,j} = labeloverlay(C2{i,j},Result_Image{i,j},'ColorMap',cmap,'Transparency',0);
    end
end
SemSegPic_ThinSection = cell2mat(SemSegPic_ThinSection);
end