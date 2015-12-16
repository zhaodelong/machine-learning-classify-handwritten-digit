function digit_image = load_image_data(filename) 
    fid = fopen(filename,'r','b');
    magic_number = fread(fid,1,'int32');
    data_size = fread(fid,1,'int32');
    row_number = fread(fid,1,'int32');
    col_number = fread(fid,1,'int32');
    for k = 1:data_size
        for i = 1:row_number
            for j = 1:col_number
                digit_image(i,j,k) = fread(fid,1,'uint8');
            end
        end
    end
end
