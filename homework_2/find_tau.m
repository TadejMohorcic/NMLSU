function t = find_tau(t_start, t_end, A, B, W, tol, max_steps)

i = 0;
e = Inf;

while i < max_steps && e > tol
    t = (t_start + t_end)/2;
    
    K = B'*inv(W(t));
    M = A - B*K;
    
    r = real(eigs(M, 1, 'largestreal'));

    % error to max real eig value - 1.4
    e = abs(r - 1.4);
    
    if r < -1.4
        t_start = t;
    else
        t_end = t;
    end

    i = i + 1;
end

end