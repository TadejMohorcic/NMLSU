function x = resi_delta_sep(A, B, z)

n1 = size(A, 1);
n2 = size(B, 1);

Z = reshape(z, [n1, n2]);

Y = lyap(A, -B, -Z);
X = lyap(A', -B', -Y);

x = X(:);

end