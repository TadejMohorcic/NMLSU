function s = diagram(K, G1, G2, H1, H2, H3)
% function s = diagram(K, G1, G2, H1, H2, H3) vrne prenostno funkcijo
% sistema, opisanega z diagramom na spletni ucilnici.

b1 = feedback(G1, H2);
b2 = series(b1, G2);
b3 = feedback(b2, H1);
b4 = feedback(b3, H3);
b5 = series(b4, tf(1, [1 0]));
b6 = series(K, b5);
s = feedback(b6, 1);

end