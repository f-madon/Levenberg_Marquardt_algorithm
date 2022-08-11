function [A, At] = gradiente(w, x)
A = zeros(length(x), 3);
for i = 1 : length(x)
    A(i, 1) = -1;
    A(i, 2) =  -exp(w(3) * x(i));
    A(i, 3) = -w(2) * x(i)  * exp(w(3) * x(i));
end
At = A';
