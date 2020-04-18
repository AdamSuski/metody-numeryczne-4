clc;
clf;
clear;

N = 2:2:20;
x = linspace(0,2,101);
f = @(x) cos(pi / 2 .* (x - 1)) .* sin(3*pi .* x);
g = @(x) cos(pi / 2 .* (x - 1)) .* sin(3*pi .* x) .^ 2;

yfFunction = f(x);
ygFunction = g(x);

errorArrayF = ones(1,length(N)/2);
errorArrayG = ones(1,length(N)/2);

% plot(x,yFunction,'x');
% grid on;
% title("Interpolacja metoda Lagrangea");
% xlabel("x");
% ylabel("f(x)");
% hold on;

for n = N
    n;
    wezlyF = daj_wezly(n,f);
    wezlyG = daj_wezly(n,g);
    yF = lagrange(x,wezlyF);
    yG = lagrange(x,wezlyG);
    %plot(x, y);
    errorsF = abs(yF - yfFunction);
    errorsG = abs(yG - ygFunction);
    maxErrorF = max(errorsF);
    maxErrorG = max(errorsG);
    errorArrayF(1,n/2) = maxErrorF;
    errorArrayG(1,n/2) = maxErrorG;
end

subplot(2,1,1);
semilogy(N,errorArrayF,'or');
ylabel('Wartosc bledu');
xlabel('Liczba wezlow');
title('Wykres błędu maksymalnego interpolacji Lagrangea dla funkcji f(x)');
grid on;

subplot(2,1,2);
semilogy(N,errorArrayG,'or');
ylabel('Wartosc bledu');
xlabel('Liczba wezlow');
title('Wykres błędu maksymalnego interpolacji Lagrangea dla funkcji g(x)');
grid on;