function [ out ] = normalcoords(X)

    out = [X(:,1) ./ X(:,3), X(:,2) ./ X(:,3)];

end

