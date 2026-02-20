% ----- 1. naloga -----
p = [1, 14.1, 72.4, 161.1, 135.4, 12];
q = [1, 14, 71, 154, 120];

% ----- 1.a) -----
x = linspace(-8, 2, 1000);
y = sqrt(abs(polyval(p, x)));
figure; plot(x, y); title('Zeros of polynomial p')

zero = bisection(p, -1, 0, 1000, 1e-8);
disp(zero)

% ----- 1.b) -----
R = routh(p);
s = sum(R(:,1)) + sum(R(:, 2));
disp(s)

% ----- 1.c) -----
% p - a*q premakne največjo ničlo za ravno a v desno.
alfa = 0.1;
y2 = sqrt(abs(polyval(p - alfa*[0, q], x)));
figure; plot(x, y2); title('Zeros of polynomial p - 0.1 * q')
disp(alfa)