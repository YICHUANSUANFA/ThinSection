clc;
clear;
load E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\GTruth_Revolve_1433.mat;
load E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\Results\CPL_VGG16_Class_No_Attention\trainedNet_VGG16_2.mat;

imageDir = 'E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\Revolve_Imds_Test\';
% prefix='HRTEM_image_224_';% 文件名前缀
% format='png';% 文件格式
% suffix=strcat('.',format);% 文件后缀
imds = imageDatastore(imageDir,...
    'IncludeSubfolders',false,...
    'FileExtensions','.png',...
    'LabelSource','foldernames');% 训练图像
% 修改图像的标签顺序
% for Num=1:length(imds.Files)
%     transform_path = strcat(imageDir,prefix,num2str(Num),suffix);
%     imds.Files{Num,1}=transform_path;
% end
classNames = ["Quartz","Feldspar","Debris","BlackMica","Muscovite","RedCasting","BuleCasting","magnetite","Chert","siderite","Scale100","Scale200","Scale50","Glauconite"];
pxds = pixelLabelDatastore(GTruth);% 图像标签
pxdsResults = semanticseg(imds,net, ...
    'MiniBatchSize',1, ...
    'WriteLocation',tempdir, ...
    'Verbose',false);
metrics = evaluateSemanticSegmentation(pxdsResults,pxds,'Verbose',false);
metrics.DataSetMetrics
metrics.ClassMetrics