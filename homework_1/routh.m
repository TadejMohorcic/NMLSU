function R = routh(p)
% function R = routh(p) vrne Routh--Hurwitzovo tabelo za polinom
% p = [a_n, .., a_1, a_0].

n = length(p);

if mod(n, 2) ~= 0
    p = [p, 0];
end

R = zeros(n, floor((n + 1)/2));

R(1, :) = p(1:2:end);
R(2, :) = p(2:2:end);

for k = 3:n
    r = R(k - 2, 1) / R(k - 1, 1);
    R(k,:) = [R(k - 2, 2:end), 0] - r * [R(k - 1, 2:end), 0];
end

end