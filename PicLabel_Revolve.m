% ���������
% �����е�ͼ����ת������
clc;
clear;
InputPicBG='E:\TYUT\��ʯ��Ƭʶ��\��8\SemanticSegmentation_Scale\XPL\Train_224\*.png';% ����ԭͼ�Ĵ��λ�����png�ļ�
InputPicPath='E:\TYUT\��ʯ��Ƭʶ��\��8\SemanticSegmentation_Scale\XPL\Train_224\';% ����ԭͼ�Ĵ��λ��
SavePathName='E:\TYUT\��ʯ��Ƭʶ��\��8\SemanticSegmentation_Scale\XPL\Revolve_Train_224\';% �ļ�����·��
prefix='_';% �ļ���ǰ׺
format='png';% �ļ���ʽ
suffix=strcat('.',format);% �ļ���׺
FilePic=dir(InputPicBG);% �ҵ��ļ����з���Ҫ���ͼƬ
Input_Pic=cell(1,length(FilePic));
Output_Pic = cell(16,length(FilePic)); % �ü�֮������ͼ��
for i=1:length(FilePic)
    Input_Pic{1,i}=imread([InputPicPath,FilePic(i).name]);% ���ļ����е�ͼƬ���뵽ϸ��������
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
    SaveName_g = strip(FilePic(m).name,'right','g');% ȥ��g
    SaveName_n = strip(SaveName_g,'right','n');% ȥ��n
    SaveName_p = strip(SaveName_n,'right','p');% ȥ��p
    SaveName = strip(SaveName_p,'right','.');% ȥ��p
    imwrite(uint8(Input_Pic{1,m}),strcat(SavePathName,SaveName,prefix,num2str(x1),suffix));% ����ͬ��
end
for m=num1+1:num2
    Input_Pic{1,m-num1}=imrotate(Input_Pic{1,m-num1},90);
    SaveName_g = strip(FilePic(m-num1).name,'right','g');% ȥ��g
    SaveName_n = strip(SaveName_g,'right','n');% ȥ��n
    SaveName_p = strip(SaveName_n,'right','p');% ȥ��p
    SaveName = strip(SaveName_p,'right','.');% ȥ��p
    imwrite(Input_Pic{1,m-num1},strcat(SavePathName,SaveName,prefix,num2str(x2),suffix));
end
for m=num2+1:num3
    Input_Pic{1,m-num2}=imrotate(Input_Pic{1,m-num2},90);
    SaveName_g = strip(FilePic(m-num2).name,'right','g');% ȥ��g
    SaveName_n = strip(SaveName_g,'right','n');% ȥ��n
    SaveName_p = strip(SaveName_n,'right','p');% ȥ��p
    SaveName = strip(SaveName_p,'right','.');% ȥ��p
    imwrite(Input_Pic{1,m-num2},strcat(SavePathName,SaveName,prefix,num2str(x3),suffix));
end
for m=num3+1:num4
    Input_Pic{1,m-num3}=imrotate(Input_Pic{1,m-num3},90);
    SaveName_g = strip(FilePic(m-num3).name,'right','g');% ȥ��g
    SaveName_n = strip(SaveName_g,'right','n');% ȥ��n
    SaveName_p = strip(SaveName_n,'right','p');% ȥ��p
    SaveName = strip(SaveName_p,'right','.');% ȥ��p
    imwrite(Input_Pic{1,m-num3},strcat(SavePathName,SaveName,prefix,num2str(x4),suffix));
end