% ----- 2. naloga -----
G1 = tf(1, [1 1]);
G2 = tf([1 0], [1 2]);
H1 = tf(1, [1 3]);
H2 = tf(3, [1 4]);
H3 = tf([1 2], [1 5]);
K = 10;

% ----- 2.a) -----
sys = diagram(K, G1, G2, H1, H2, H3);
disp(pole(sys))

% ----- 2.b) -----
impulse(sys)
[y, t] = impulse(sys);
sysinfo = lsiminfo(y, t, 0);
disp(sysinfo.TransientTime)

% ----- 2.c) -----
k_opt = fzero(@(x) dcgain(diagram(x, G1, G2, H1, H2, H3)) - 0.8, 15);
disp(k_opt)

% ----- 2.d) -----
s = linspace(0, 10, 1000);
u = cos(5 * s) .* exp(-s);
k_max = fzero(@(x) max(lsim(diagram(x, G1, G2, H1, H2, H3), u, s)) - 0.1, 5);
disp(k_max)