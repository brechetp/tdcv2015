function [ out, leaves ] = readTree( n )
    
    file = fopen(['files/Tree' int2str(n) '.txt']);
    num = str2num(fgets(file)); %skip first line
    out = textscan(file, '%d %d %d %f %d %d %d %d %d %d %d', num);
    fgets(file);
    num2 = str2num(fgets(file));
    leaves = textscan(file, '%d %f %f', num2);
    fclose(file);
    
end

