function [ fid ] = getFidelity( resp,  desc)

if desc == 0
    [A, B] = sort(resp(:));
else
    [A, B] = sort(resp(:), 'descend');
end

fid = A(2) - A(1);


end

