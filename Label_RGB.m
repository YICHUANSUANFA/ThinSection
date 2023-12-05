format='png';% 文件格式
suffix=strcat('.',format);% 文件后缀
SavePathName='E:\TYUT\岩石薄片识别\论文\论文对比图八\';% 文件保存路径

L1 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\Label_224\Label_18_2_12.png');
L2 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\Label_224\Label_20_3_14.png');
L3 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\Label_224\Label_28_2_10.png');
L4 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\Label_224\Label_48_1_16.png');
L5 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\Label_224\Label_49_2_10.png');
L6 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\Label_224\Label_55_2_11.png');
L7 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\Label_224\Label_18_1_6.png');
L8 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\Label_224\Label_18_1_7.png');
L9 = imread('E:\TYUT\岩石薄片识别\盒8\SemanticSegmentation_Scale\CPL\Label_224\Label_18_2_13.png');

Image1 = Test_Image_Color(L1);figure;imshow(Image1);
Image2 = Test_Image_Color(L2);figure;imshow(Image2);
Image3 = Test_Image_Color(L3);figure;imshow(Image3);
Image4 = Test_Image_Color(L4);figure;imshow(Image4);
Image5 = Test_Image_Color(L5);figure;imshow(Image5);
Image6 = Test_Image_Color(L6);figure;imshow(Image6);
Image7 = Test_Image_Color(L7);figure;imshow(Image7);
Image8 = Test_Image_Color(L8);figure;imshow(Image8);
Image9 = Test_Image_Color(L9);figure;imshow(Image9);

x1 = 1001; imwrite(Image1,strcat(SavePathName,num2str(x1),suffix));
x2 = 1002; imwrite(Image2,strcat(SavePathName,num2str(x2),suffix));
x3 = 1003; imwrite(Image3,strcat(SavePathName,num2str(x3),suffix));
x4 = 1004; imwrite(Image4,strcat(SavePathName,num2str(x4),suffix));
x5 = 1005; imwrite(Image5,strcat(SavePathName,num2str(x5),suffix));
x6 = 1006; imwrite(Image6,strcat(SavePathName,num2str(x6),suffix));
x7 = 1007; imwrite(Image7,strcat(SavePathName,num2str(x7),suffix));
x8 = 1008; imwrite(Image8,strcat(SavePathName,num2str(x8),suffix));
x9 = 1009; imwrite(Image9,strcat(SavePathName,num2str(x9),suffix));