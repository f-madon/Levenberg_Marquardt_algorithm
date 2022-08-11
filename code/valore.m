function [F] = valore(w, x)
g = inline('x^2', 'x');
F = 0;
for k = 1 : length(x)
    ff = g(x(k)) - w(1) - w(2) * exp(w(3) * x(k));
    F = F + ff^2;
end