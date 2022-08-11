function [f] = interno(w, x)
g = inline('x^2', 'x');
f = zeros(20, 1);
for k = 1 : length(x)
    f(k) = g(x(k)) - w(1) - w(2) * exp(w(3) * x(k));
end