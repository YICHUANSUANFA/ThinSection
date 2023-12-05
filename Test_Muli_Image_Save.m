% 测试文件夹中所有的Muli图片
clc
clear
load E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\GTruth_Revolve_1433.mat;
load E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\Results\MuliImageSS_ResNet50_SeriesClass_ResAttention\trainedNet_resnet50_3.mat;
InputPicBG_XPL = 'E:\TYUT\岩石薄片识别\论文\尺寸大小占比\B\*.png';% 背景原图的存放位置里的tif文件
InputPicPath_XPL = 'E:\TYUT\岩石薄片识别\论文\尺寸大小占比\B\';% 背景原图的存放位置
InputPicBG_CPL = 'E:\TYUT\岩石薄片识别\论文\尺寸大小占比\A\*.png';% 背景原图的存放位置里的tif文件
InputPicPath_CPL='E:\TYUT\岩石薄片识别\论文\尺寸大小占比\A\';% 背景原图的存放位置

SavePathName = 'E:\TYUT\岩石薄片识别\论文\尺寸大小占比\MuliImageSS_ResNet50_SeriesClass_ResAttention\';% 文件保存路径
prefix='_';% 文件名前缀
format='png';% 文件格式
suffix=strcat('.',format);% 文件后缀
FilePic_XPL = dir(InputPicBG_XPL);% 找到文件夹中符合要求的图片
Input_Pic_XPL=cell(1,length(FilePic_XPL));
Output_Pic = cell(1,length(FilePic_XPL)); % 裁剪之后的输出图像
for i=1:length(FilePic_XPL)
    Input_Pic_XPL{1,i}=imread([InputPicPath_XPL,FilePic_XPL(i).name]);% 将文件夹中的图片存入到细胞矩阵中
end
FilePic_CPL = dir(InputPicBG_CPL);% 找到文件夹中符合要求的图片
Input_Pic_CPL = cell(1,length(FilePic_CPL));
for i=1:length(FilePic_CPL)
    Input_Pic_CPL{1,i}=imread([InputPicPath_CPL,FilePic_CPL(i).name]);% 将文件夹中的图片存入到细胞矩阵中
end

for m=1:length(FilePic_XPL)
    Output_Pic{1,m} = Test_Muli_Image(Input_Pic_CPL{1,m},Input_Pic_XPL{1,m},GTruth,net);
end
for y = 1:length(FilePic_XPL)
        SaveName_g = strip(FilePic_XPL(y).name,'right','g');% 去除g
        SaveName_n = strip(SaveName_g,'right','n');% 去除n
        SaveName_p = strip(SaveName_n,'right','p');% 去除p
        SaveName = strip(SaveName_p,'right','.');% 去除p
        imwrite(Output_Pic{1,y},strcat(SavePathName,SaveName,suffix));% 保持同名
end