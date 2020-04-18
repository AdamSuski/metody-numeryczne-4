clear all;
close all;
clc;

%A = [1 2 5; 3 6 1; 2 -1 4;];
%Y = [20; 18; 12];
N = 10;
Ain = rand(N, N);
bin = rand(N, 1);
Abin = horzcat(Ain, bin);

[Abw, xbw] = gauss_jordan_elimination(Abin, false);
disp('Norma L2 bez wyboru: ');
norma_L2_bez_wyboru = norm(Ain*xbw-bin, 2);
disp(norma_L2_bez_wyboru);

[Azw, xzw] = gauss_jordan_elimination(Abin, true);
disp('Norma L2 z wyborem: ');
norma_L2_z_wyborem = norm(Ain*xzw-bin, 2);
disp(norma_L2_z_wyborem);

y_z = ones(1, 21);
y_b = ones(1, 21);
x = ones(1, 21);
start = 100;
krok = 10;
koniec = 300;
position = 1;
for i = start:krok:koniec
    x(position) = i;
    Ai = rand(N, N);
    bi = rand(N, 1);
    Abi = horzcat(Ai, bi);
    [~, xb] = gauss_jordan_elimination(Abin, false);
    y_b(position)= norm(Ai * xb - bi, 2);
    [~, xz] = gauss_jordan_elimination(Abin, true);
    y_z(position) = norm(Ai * xz - bi, 2);
    position = position + 1;
end

loglog(x, y_z, 'x', x, y_b, 'o');
title('Norma L2 metody Gaussa-Jordana z wyborem i bez wyboru elementu glownego');
xlabel('Wielkość macierzy []');
ylabel('Norma L2 []');
legend('z wyborem', 'bez wyboru');
grid on;