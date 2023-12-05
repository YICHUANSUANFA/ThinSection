% 程序第三步
% 将所有的图像旋转并保存
clc;
clear;
InputPicBG='E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\XPL\Train_224\*.png';% 背景原图的存放位置里的png文件
InputPicPath='E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\XPL\Train_224\';% 背景原图的存放位置
SavePathName='E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\XPL\Revolve_Train_224\';% 文件保存路径
prefix='_';% 文件名前缀
format='png';% 文件格式
suffix=strcat('.',format);% 文件后缀
FilePic=dir(InputPicBG);% 找到文件夹中符合要求的图片
Input_Pic=cell(1,length(FilePic));
Output_Pic = cell(16,length(FilePic)); % 裁剪之后的输出图像
for i=1:length(FilePic)
    Input_Pic{1,i}=imread([InputPicPath,FilePic(i).name]);% 将文件夹中的图片存入到细胞矩阵中
end
num1 = length(FilePic) ;
num2 = num1*2;
num3 = num1*3;
num4 = num1*4;
x1 = 1;
x2 = 2;
x3 = 3;
x4 = 4;
for m=1:num1
    SaveName_g = strip(FilePic(m).name,'right','g');% 去除g
    SaveName_n = strip(SaveName_g,'right','n');% 去除n
    SaveName_p = strip(SaveName_n,'right','p');% 去除p
    SaveName = strip(SaveName_p,'right','.');% 去除p
    imwrite(uint8(Input_Pic{1,m}),strcat(SavePathName,SaveName,prefix,num2str(x1),suffix));% 保持同名
end
for m=num1+1:num2
    Input_Pic{1,m-num1}=imrotate(Input_Pic{1,m-num1},90);
    SaveName_g = strip(FilePic(m-num1).name,'right','g');% 去除g
    SaveName_n = strip(SaveName_g,'right','n');% 去除n
    SaveName_p = strip(SaveName_n,'right','p');% 去除p
    SaveName = strip(SaveName_p,'right','.');% 去除p
    imwrite(Input_Pic{1,m-num1},strcat(SavePathName,SaveName,prefix,num2str(x2),suffix));
end
for m=num2+1:num3
    Input_Pic{1,m-num2}=imrotate(Input_Pic{1,m-num2},90);
    SaveName_g = strip(FilePic(m-num2).name,'right','g');% 去除g
    SaveName_n = strip(SaveName_g,'right','n');% 去除n
    SaveName_p = strip(SaveName_n,'right','p');% 去除p
    SaveName = strip(SaveName_p,'right','.');% 去除p
    imwrite(Input_Pic{1,m-num2},strcat(SavePathName,SaveName,prefix,num2str(x3),suffix));
end
for m=num3+1:num4
    Input_Pic{1,m-num3}=imrotate(Input_Pic{1,m-num3},90);
    SaveName_g = strip(FilePic(m-num3).name,'right','g');% 去除g
    SaveName_n = strip(SaveName_g,'right','n');% 去除n
    SaveName_p = strip(SaveName_n,'right','p');% 去除p
    SaveName = strip(SaveName_p,'right','.');% 去除p
    imwrite(Input_Pic{1,m-num3},strcat(SavePathName,SaveName,prefix,num2str(x4),suffix));
end