A = [472.3, 0.64, 329.0; 0, 471, 268.3; 0, 0, 1]

N = 45;
I = zeros(N, 480, 640, 3);
% for i = 1:N
%    % number = [repmat('0', [1, 3-floor(log10(i-1))]), num2str(i)]
%    name = sprintf('img_sequence/%04d.png', i-1);
%    img = imread(name);
%    size(img);
%    size(I);
%    I= img;
% end
% 
% firstImg = single(I(1,:,:,:));
% size(firstImg)
% [f1,d1] = vl_sift(firstImg));

%R = eye(3);
%f([0, pi, 0], [0, 0, 0], eye(3), [1, 2, 3; 1, 4, 5], [2, 3, 2; 8, 1, 1]);


M0 = [1, 2, 3; 1, 4, 5];
mt = [2, 3, 2; 8, 1, 1];

R = zeros(N, 3);
T = zeros(N, 3);
R(1,:) = [0, 0, 0];
T(1,:) = [0, 0, 0];

% x = [R1, R2, R3, T1, T2, T3]
%N = 3;

for t = 1:N-1
    i = t+1
    PrevRot = R(i-1,:)
    PrevT = T(i-1,:)
    M0 = M{t};
    mt = m_tilde{t};
    res = fminsearch(@(x) fun(x(1:3), x(4:6), A, M0, mt), [PrevRot, PrevT]);
    %res = fminsearch(@(x) f(x(1:3), x(4:6), A, M0, mt), [PrevRot, PrevT])
    R(i,:) = res(1:3);
    T(i,:) = res(4:6);
end

figure(42);
hold on;
grid on;
for t = 1:N
    Rot = eul2rotm(R(t,:))
    Trans = T(t,:)
    P = -Rot' * Trans'
    
    text(P(1), P(2), P(3), num2str(t-1),'HorizontalAlignment','left','FontSize',8);
    if t>1
       plot3([lastP(1), P(1)], [lastP(2), P(2)], [lastP(3), P(3)]); 
    end
    
    lastP = P;
end

%103, 74; 552, 383