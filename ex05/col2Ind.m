function [ out ] = col2Ind( in )

    if in == 0
        out = 2;
    elseif in == 1
        out = 3;
    else
        out = 1;
    end

end

