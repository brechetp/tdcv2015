function [mag, dir] = compute_gradient(image)
% image is a RGC image (converted to double)

if size(image, 3) == 1
  [mag, ori] = imgradient(image);
  dir = mod(ori, 180); % we discard orientation, keep only the direction
  dir = dir / 180. * pi; % converts to rad
  return
end

[N, M, Z] = size(image);

for channel = 1:3
  [g_mag(:, :, channel), g_ori(:, :, channel)] = imgradient(image(:, :, channel));
end

[mag, idx] = max(g_mag, [], 3); % keep the maximum gradient from all channels
% idx keeps the indices of the maxima

J = ones(N, 1) * [0:M-1]; % J_ij = j
I = [0:N-1]' * ones(1, M); % I_ij = i
K = 1 + I + J*N + (idx-1) * N * M; %linear indices of the maxima for the orientation
Lin = g_ori(:);
ori = Lin(K); % we keep the orientations of the maxima
dir = mod(ori, 180); % we discard orientation, keep only the direction
dir = dir / 180. * pi; % converts to rad
return



