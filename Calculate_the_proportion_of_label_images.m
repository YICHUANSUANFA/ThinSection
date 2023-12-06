% 计算Label图片中各类矿物组分的占比
clc
clear
pixel_num = zeros(1,14);
x = 224;
y = 224;
InputPicBG = 'E:\SemanticSegmentation_Scale\NET_Muli_CPL_XPL_All\Revolve_Pxds_Test\*.png';% 背景原图的存放位置里的tif文件
InputPicPath = 'E:\SemanticSegmentation_Scale\NET_Muli_CPL_XPL_All\Revolve_Pxds_Test\';% 背景原图的存放位置
FilePic=dir(InputPicBG);% 找到文件夹中符合要求的图片
Input_Pic=cell(1,length(FilePic));
for i=1:length(FilePic)
    Input_Pic{1,i}=imread([InputPicPath,FilePic(i).name]);% 将文件夹中的图片存入到细胞矩阵中
end
for m=1:length(FilePic)
    for i = 1:x
        for j = 1:y
            if Input_Pic{1,m}(i,j) == 1 % 石英
                pixel_num(1,1) = pixel_num(1,1) + 1;
            elseif Input_Pic{1,m}(i,j) == 2 % 长石
                pixel_num(1,2) = pixel_num(1,2) + 1;
            elseif Input_Pic{1,m}(i,j) == 3 % 岩屑
                pixel_num(1,3) = pixel_num(1,3) + 1;
            elseif Input_Pic{1,m}(i,j) == 4 % 黑云母
                pixel_num(1,4) = pixel_num(1,4) + 1;
            elseif Input_Pic{1,m}(i,j) == 5 % 白云母
                pixel_num(1,5) = pixel_num(1,5) + 1;
            elseif Input_Pic{1,m}(i,j) == 6 % 红色铸体
                pixel_num(1,6) = pixel_num(1,6) + 1;
            elseif Input_Pic{1,m}(i,j) == 7 % 黄色铸体
                pixel_num(1,7) = pixel_num(1,7) + 1;
            elseif Input_Pic{1,m}(i,j) == 8 % 磁铁矿
                pixel_num(1,8) = pixel_num(1,8) + 1;
            elseif Input_Pic{1,m}(i,j) == 9 % 隧石
                pixel_num(1,9) = pixel_num(1,9) + 1;
            elseif Input_Pic{1,m}(i,j) == 10 % 菱铁矿
                pixel_num(1,10) = pixel_num(1,10) + 1;
            elseif Input_Pic{1,m}(i,j) == 11 % 比例尺100
                pixel_num(1,11) = pixel_num(1,11) + 1;
            elseif Input_Pic{1,m}(i,j) == 12 % 比例尺200
                pixel_num(1,12) = pixel_num(1,12) + 1;
            elseif Input_Pic{1,m}(i,j) == 13 % 比例尺50
                pixel_num(1,13) = pixel_num(1,13) + 1;
            elseif Input_Pic{1,m}(i,j) == 14 % 海绿石
                pixel_num(1,14) = pixel_num(1,14) + 1;
            end
        end
    end
end