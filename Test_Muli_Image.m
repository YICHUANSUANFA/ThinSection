function B2 = Test_Muli_Image(A,B,GTruth,net)
cmap = GTruth.LabelDefinitions.LabelColor;

C = Muli_Two_Image(A,B);
maxrow = 224;
maxcol = 224;
[C_cell,max_row,max_col]=Muli_Partion(A,B,maxrow,maxcol);
[C2,~,~]=Partion(A,maxrow,maxcol);
Result_Image = cell(max_row,max_col);
B2 = cell(max_row,max_col);

for i =1:max_row
    for j =1:max_col
        Result_Image{i,j} = semanticseg(C_cell{i,j}, net);
        B2{i,j} = labeloverlay(C2{i,j},Result_Image{i,j},'ColorMap',cmap,'Transparency',0);
    end
end
B2 = cell2mat(B2);
end