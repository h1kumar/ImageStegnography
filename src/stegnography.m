function[z]=stegnography(a,b)
% Encrypting a grayscale image into RGB image
size_image = size(a);
size_b=size(b);
imtool(a);

b= rgb2gray(b);
imtool(b);
b_binary = de2bi(b);
red_a = a(:,:,1); green_a = a(:,:,2); blue_a =a(:,:,3);
%figure,imshow(cat(2,red_a,green_a));
red_a_binary = de2bi(red_a);green_a_binary = de2bi(green_a);blue_a_binary = de2bi(blue_a);
red_a1 = zeros(size_image(1:2));blue_a1 = zeros(size_image(1:2));green_a1 = zeros(size_image(1:2));
for i=1:1:size_b(1)*size_b(2)
    red_a_binary(i,1)=b_binary(i, 8);
    red_a_binary(i,2)=b_binary(i, 7);
    green_a_binary(i,1)=b_binary(i, 6);
    green_a_binary(i,2)=b_binary(i, 5);
    blue_a_binary(i,1)=b_binary(i, 4);
    blue_a_binary(i,2)=b_binary(i, 3);
end;
red_a_decimal = bi2de(red_a_binary);
green_a_decimal = bi2de(green_a_binary);
blue_a_decimal = bi2de(blue_a_binary);

for i = 1:1:size_image(1) %rows 1200
    for j = 1:1:size_image(2) %columns 1920
        red_a1(i,j) = red_a_decimal(i+size_image(1)*(j-1));
        green_a1(i,j) = green_a_decimal(i+size_image(1)*(j-1));
        blue_a1(i,j) = blue_a_decimal(i+size_image(1)*(j-1));
    end;
end;
red_a_unint8 = uint8(red_a1);green_a_unint8 = uint8(green_a1);blue_a_unint8 = uint8(blue_a1);
combined_a = cat(3,red_a_unint8,green_a_unint8,blue_a_unint8);
imtool(combined_a);

extract_b = extraction(combined_a);
imtool(extract_b);
z = extract_b;
end