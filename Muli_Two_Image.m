function C = Muli_Two_Image(A,B)
[x,y,~] = size(A);
C = zeros(x,y,6);
C(:,:,1) = A(:,:,1);
C(:,:,2) = A(:,:,2);
C(:,:,3) = A(:,:,3);
C(:,:,4) = B(:,:,1);
C(:,:,5) = B(:,:,2);
C(:,:,6) = B(:,:,3);
C = uint8(C);
end