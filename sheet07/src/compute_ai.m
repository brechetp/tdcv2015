function Ai = compute_ai (point1, point2)
Ai = zeros(2, 9);
Ai(1,:) = [repmat(0, [1, 3]), -point2(3) * point1, point2(2) * point1];
Ai(2, :) = [point2(3)* point1, 0, 0, 0, -point2(1)* point1];
end

