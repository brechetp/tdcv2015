function [ out ] = truncatezeros( data )
%TRUNCATEZEROS Summary of this function goes here
%   Detailed explanation goes here
out = data;
out( ~any(data,2), : ) = [];
out( :, ~any(data,1) ) = [];

end

