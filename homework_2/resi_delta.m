function x = resi_delta(A1, B1, C1, A2, B2, C2, z)

n1 = size(A1, 1);
n2 = size(A2, 1);

Z = reshape(z, [n2, n1]);

A = inv(B2) * C2;
B = -C1' * inv(B1');
C = inv(B2) * A2 * Z * C1' * inv(B1') - inv(B2) * C2 * Z * A1' * inv(B1');

X = lyap(A, B, C);

x = X(:);

end