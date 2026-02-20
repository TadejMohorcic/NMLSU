function k = strength(sys, a, b, maxIter, tol, j)
% function k = strength(sys, v, t, maxIter, tol, r) vrne k, pri katerem je
% jakost izhodnega signala enaka j-krat jakosti vhodnega signala. Izvaja
% se dokler ne presezemo najvecjega stevila korakov maxIter, oziroma dokler
% ne dosežemo tolerance tol.

t = linspace(0, 10, 5000);

diff = Inf;
i = 0;

while i < maxIter && diff > tol
    k = (a + b)/2;

    v = cos(k .* t);
    y = lsim(sys, v, t);

    test = max(y(2500:end, 2));
    if test < j
        b = k;
    elseif test > j
        a = k;
    end
    
    diff = abs(j - test);
    i = i + 1;
    
end

end