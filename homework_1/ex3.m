% ----- 3. naloga -----
r = 2;
l = 0.2;
c = 0.15;

A = [-r/l -1/l; 1/c 0];
B = [1/l; 0];
C = [1 0; 0 1];
D = [0; 0];

sys = ss(A, B, C, D);

t = linspace(0, 10, 5000);
u = ones(1, length(t));

% ----- 3.a) -----
y = lsim(sys, u, t);

disp(mean(y(:, 1)))

% ----- 3.b) -----
k = strength(sys, 1, 30, 1000, 1e-8, 0.1);
disp(k)

% ----- 3.c) -----
alfa = 10;
beta = 2;
gama = 1e-8;

v0 = [alfa zeros(1, length(t) - 1)];
v1 = ones(1, length(t));
v2 = linspace(0, 10, 5000);
v = v0 + beta * v1 + gama * v2;

res = 0.1 * ones(length(t), 1);

lsim(sys, v, t);
