clc
clear
InputPicBG = 'E:\MuliImageSS_ResNet50_SeriesClass_ResAttention\*.png';% 背景原图的存放位置里的tif文件
InputPicPath = 'E:\MuliImageSS_ResNet50_SeriesClass_ResAttention\';% 背景原图的存放位置
FilePic=dir(InputPicBG);% 找到文件夹中符合要求的图片
Input_Pic=cell(1,length(FilePic));
Dis_statistics = cell(length(FilePic),2);
for i=1:length(FilePic)
    Input_Pic{1,i}=imread([InputPicPath,FilePic(i).name]);% 将文件夹中的图片存入到细胞矩阵中
end
for m=1:length(FilePic)
    A = rgb2gray(Input_Pic{1,m});
    [R_Dis_statistics,C_Dis_statistics] = Length_statistics(A);
    Dis_statistics{m,1} = R_Dis_statistics;
    Dis_statistics{m,2} = C_Dis_statistics;
end