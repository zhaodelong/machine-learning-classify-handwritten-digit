function image_label = load_label_data(filename)  
    fid = fopen(filename,'r','b');
    magic_number = fread(fid,1,'int32');
    data_size = fread(fid,1,'int32');
    for k = 1:data_size
        image_label(k) = fread(fid,1,'uint8');
    end
end
   