% 语义分割
clear;
clc;
load E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\GTruth_Revolve_12903.mat;

imageDir = 'E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\NET_Muli_CPL_XPL_All\Revolve_Imds_Train\';

imds = imageDatastore(imageDir,...
    'IncludeSubfolders',false,...
    'FileExtensions','.mat',...
    'LabelSource','foldernames',...
    ReadFcn = @matRead6Channels);% 训练图像'ReadFcn' 'matRead6Channels',...
classNames = ["Quartz","Feldspar","Debris","BlackMica","Muscovite","RedCasting","BuleCasting","magnetite","Chert","siderite","Scale100","Scale200","Scale50","Glauconite"];
pxds = pixelLabelDatastore(GTruth);% 图像标签

imageSize = [224,224];
numClasses = numel(classNames);% 返回classNames中元素个数
lgraph = deeplabv3plusLayers(imageSize,numClasses,'resnet50');% 使用labv3架构

% 根据输入图像数据存储区和像素标签数据存储区对象返回一个数据存储区。 
% imds是一个ImageDatastore对象，它代表对网络的训练输入。 
% pxds是一个PixelLabelDatastore对象，代表所需的网络输出。
% pixelLabelImageDatastore（gTruth，'PatchesPerImage'，40）
% 创建一个像素标签图像数据存储，该数据存储从gTruth中的每个地面真实对象随机生成40个色块。
pximds = pixelLabelImageDatastore(imds,pxds,'OutputSize',[224,224],...
    'ColorPreprocessing','gray2rgb');

opts = trainingOptions('adam',...
    "ExecutionEnvironment","gpu",...
    "InitialLearnRate",0.001,...
    'MiniBatchSize',16,...
    "Plots","training-progress",...
    'MaxEpochs',28);
% augmenter = imageDataAugmenter('RandXReflection',true,...
%     'RandXTranslation',[-10 10],'RandYTranslation',[-10 10]);
[net,info] = trainNetwork(pximds,lgraph,opts);

tbl = countEachLabel(pxds);
totalNumberOfPixels = sum(tbl.PixelCount);
frequency = tbl.PixelCount / totalNumberOfPixels;
frequency(1,1) = frequency(1,1) - 0.1;
frequency(2,1) = frequency(2,1) + 0;
frequency(3,1) = frequency(3,1) - 0.21;
frequency(4,1) = frequency(4,1) + 0.022;
frequency(5,1) = frequency(5,1) + 0.04;
frequency(6,1) = frequency(6,1) + 0;
frequency(7,1) = frequency(7,1) + 0.033;
frequency(8,1) = frequency(8,1) + 0.02;
frequency(9,1) = frequency(9,1) + 0.01;
frequency(10,1) = frequency(10,1) + 0.025;
frequency(11,1) = frequency(11,1) + 0.04;
frequency(12,1) = frequency(12,1) + 0.04;
frequency(13,1) = frequency(13,1) + 0.04;
frequency(14,1) = frequency(14,1) + 0.04;
classWeights = 1./frequency;
pixelClassificationLayerEnd = pixelClassificationLayer('Classes',tbl.Name,'ClassWeights',classWeights);
save('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\Attention\trainedNet_resnet50_attention.mat','net');
save('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\Attention\trainInfo_resnet50_attention.mat','info');

% imds.Files{2,1}='F:\AI\Agriculture\grape\GP_Label\backgroundimage_2.jpg';
%  imds.Files{2,1}
% 
% ans =
% 
%     'F:\AI\Agriculture\grape\GP_Label\backgroundimage_2.jpg'
% 测试
% I = readimage(imds,35);
% C = semanticseg(I, net);
% cmap = GTruth.LabelDefinitions.LabelColor;
% B = labeloverlay(I,C,'ColorMap',cmap,'Transparency',0.4);
% imshow(B)
% pixelLabelColorbar(cmap,classNames);
% 与实际对比
% 将 C 中的结果与 pxdsTest 中存储的预期真实值进行比较。
% 绿色和品红色区域突出显示了分割结果与预期真实值不同的区域。
% expectedResult = readimage(pxds,35);
% actual = uint8(C);
% expected = uint8(expectedResult);
% imshowpair(actual, expected)
% iou = jaccard(C,expectedResult);
% table(classes,iou)