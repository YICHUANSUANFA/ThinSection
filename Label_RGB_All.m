% 将所有的一个文件夹中的label转化为彩色图像
clc;
clear;
InputPicBG='E:\TYUT\岩石薄片识别\论文\效果对比图\CPL_XPL_MULI\Label\*.png';% 背景原图的存放位置里的tif文件
InputPicPath='E:\TYUT\岩石薄片识别\论文\效果对比图\CPL_XPL_MULI\Label\';% 背景原图的存放位置
SavePathName='E:\TYUT\岩石薄片识别\论文\效果对比图\CPL_XPL_MULI\Label_RGB\';% 文件保存路径
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
    Output_Pic{1,m} = Test_Image_Color(Input_Pic{1,m});
end
for y = 1:length(FilePic)
        SaveName_g = strip(FilePic(y).name,'right','g');% 去除g
        SaveName_n = strip(SaveName_g,'right','n');% 去除n
        SaveName_p = strip(SaveName_n,'right','p');% 去除p
        SaveName = strip(SaveName_p,'right','.');% 去除p
        imwrite(Output_Pic{1,y},strcat(SavePathName,SaveName,suffix));% 保持同名
end