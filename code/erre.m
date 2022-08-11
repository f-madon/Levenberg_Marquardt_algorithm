function [r] = erre(f, A, h, gamma, B)
vett1 = [f; 0; 0; 0];
mat2 = [A; gamma * B];
vett2 = mat2 * h;
vettore_r = vett1 + vett2;
r = norm(vettore_r);