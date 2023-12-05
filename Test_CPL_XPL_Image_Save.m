% 测试文件夹中所有的CPL或者XPL图片
clc
clear
load E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\GTruth_Revolve_1433.mat;
load E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\Results\CPL_ResNet50_Class_No_Attention\trainedNet_resnet50.mat;
InputPicBG='E:\TYUT\岩石薄片识别\论文\效果对比图\CPL_XPL_MULI\A\*.png';% 背景原图的存放位置里的tif文件
InputPicPath='E:\TYUT\岩石薄片识别\论文\效果对比图\CPL_XPL_MULI\A\';% 背景原图的存放位置
SavePathName='E:\TYUT\岩石薄片识别\论文\效果对比图\CPL_XPL_MULI\A_Test_CPL_NoAttention\';% 文件保存路径
prefix='_';% 文件名前缀
format='png';% 文件格式
suffix=strcat('.',format);% 文件后缀
FilePic=dir(InputPicBG);% 找到文件夹中符合要求的图片
Input_Pic=cell(1,length(FilePic));
Output_Pic = cell(1,length(FilePic)); % 裁剪之后的输出图像
for i=1:length(FilePic)
    Input_Pic{1,i}=imread([InputPicPath,FilePic(i).name]);% 将文件夹中的图片存入到细胞矩阵中
end
for m=1:length(FilePic)
    Output_Pic{1,m} = Test_CPL_XPL_Image(Input_Pic{1,m},GTruth,net);
end
for y = 1:length(FilePic)
        SaveName_g = strip(FilePic(y).name,'right','g');% 去除g
        SaveName_n = strip(SaveName_g,'right','n');% 去除n
        SaveName_p = strip(SaveName_n,'right','p');% 去除p
        SaveName = strip(SaveName_p,'right','.');% 去除p
        imwrite(Output_Pic{1,y},strcat(SavePathName,SaveName,suffix));% 保持同名
end