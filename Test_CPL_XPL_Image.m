function B = Test_CPL_XPL_Image(A,GTruth,net)
% 测试文件夹中所有的CPL或者XPL图片
cmap = GTruth.LabelDefinitions.LabelColor;

% A = imread('E:\TYUT\岩石薄片识别\论文\效果对比图\CPL_XPL_MULI\A\1_18_1_7_1.png');
maxrow = 224;
maxcol = 224;
[C,max_row,max_col] = Partion(A,maxrow,maxcol);
Result_Image = cell(max_row,max_col);
B = cell(max_row,max_col);

for i =1:max_row
    for j =1:max_col
        Result_Image{i,j} = semanticseg(C{i,j}, net);
        B{i,j} = labeloverlay(C{i,j},Result_Image{i,j},'ColorMap',cmap,'Transparency',0);
    end
end
B = cell2mat(B);
end