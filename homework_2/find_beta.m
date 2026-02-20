function r = find_beta(b, sys, u, t)
% function res = find_beta(b, sys, u, t) returns the value of y(time) at
% some time value.

% get time for which we want the result
time = 0.8 * length(t);

% starting state, dependant on b
x0 = [1 b 2];

% simulate the system
y = lsim(sys, u, t, x0);

% return y(time)
r = y(time);

end