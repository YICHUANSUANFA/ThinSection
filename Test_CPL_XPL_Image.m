function B = Test_CPL_XPL_Image(A,GTruth,net)
cmap = GTruth.LabelDefinitions.LabelColor;
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