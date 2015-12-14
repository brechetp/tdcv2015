A = eye(3);

R = eye(3);
%f([0, pi, 0], [0, 0, 0], eye(3), [1, 2, 3; 1, 4, 5], [2, 3, 2; 8, 1, 1]);


M0 = [1, 2, 3; 1, 4, 5];
mt = [2, 3, 2; 8, 1, 1]
R(1,:) = [0, 0, 0];
T(1,:) = [0, 0, 0];

% x = [R1, R2, R3, T1, T2, T3]
N = 3;

for t = 1:N-1
    i = t+1
    PrevRot = R(i-1,:)
    PrevT = T(i-1,:);
    res = fminsearch(@(x) f(x(1:3), x(4:6), A, M0, mt), [PrevRot, PrevT])
    R(i,:) = res(1:3)
    T(i,:) = res(4:6)
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
