function [h] = discesa(At, f, A, gamma, B)
h = (At * A + gamma^(2) * B)\(-At * f);
