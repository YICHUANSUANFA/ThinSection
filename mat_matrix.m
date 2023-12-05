function A = mat_matrix(B)
M = fieldnames(B);
A = B.(M{1});
end