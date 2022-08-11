%The Levenberg Marquardt algorithm for optimization.

x = [ 0 : 1 / 1 9 : 1 ];
GMAX = 500;
sigma = 10^(-4);
EXPND = 1.5;
DECR = 0.5;
TOL = 10^(-8);
B = eye ( 3 );
GAMMA = ones(GMAX, GMAX);
GAMMA_v = ones(1, GMAX);

%%%% START %%%%%%%%%%%%%%%%%
wi = [0; 0; 0]; %punto iniziale
for i = 1 : GMAX
    j =1;
    [fi] = interno(wi, x);
    [Ai, Ati] = gradiente(wi, x);
    [hi] = discesa(Ati, fi, Ai, GAMMA(i, j), B);
    wi_1 = wi + hi;
    [ri] = erre(fi, Ai, hi, GAMMA(i, j) , B);
    [Fi] = valore(wi, x);
    [Fi_1] = valore(wi_1, x);
    [phi_i] = PHI(Fi, Fi_1, ri);
    while sigma > phi_i
        j = j + 1;
        GAMMA(i, j) = EXPND * GAMMA(i, j-1);
        [hi] = discesa(Ati, fi, Ai, GAMMA(i, j), B);
        wi_1 = wi + hi;
        [ri] = erre(fi, Ai, hi, GAMMA(i, j), B);
        [Fi] = valore(wi, x);
        [Fi_1] = valore(wi_1, x);
        [phi_i] = PHI(Fi, Fi_1, ri);
    end
    GAMMA_v(i) = GAMMA(i, j);
    if norm(fi) - ri < TOL || GAMMA_v(i) > GMAX
        break
    end
    if j > 1
        GAMMA(i + 1, 1) = GAMMA_v(i);
    else
        GAMMA(i + 1, 1) = DECR * GAMMA_v(i);
    end
    wi = wi_1;
end