function [ b_unint8 ] = extraction( encr_a )
%Extraction of original image from encrypted image
red_ea = encr_a(:,:,1); green_ea = encr_a(:,:,2); blue_ea = encr_a(:,:,3);
image_size = size(encr_a);

b_extract = zeros(image_size(1:2));

red_ea_binary = de2bi(red_ea);green_ea_binary = de2bi(green_ea);blue_ea_binary = de2bi(blue_ea);
binary_b = zeros(image_size(1)*image_size(2), 8);

for i = 1:1:image_size(1)*image_size(2)
    binary_b(i, 8) = red_ea_binary(i, 1);
    binary_b(i, 7) = red_ea_binary(i, 2);
    binary_b(i, 6) = green_ea_binary(i, 1);
    binary_b(i, 5) = green_ea_binary(i, 2);
    binary_b(i, 4) = blue_ea_binary(i, 1);
    binary_b(i, 3) = blue_ea_binary(i, 2);
end;

b_decimal = bi2de(binary_b);
for i = 1:1:image_size(1) %rows 1200
    for j = 1:1:image_size(2) %columns 1920
        b_extract(i,j) = b_decimal(i+image_size(1)*(j-1));
    end;
end;
b_unint8 = uint8(b_extract);
%imtool(b_unint8);
    
end

