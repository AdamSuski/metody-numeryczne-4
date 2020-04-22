%% bisekcja
clear all;
close all;
clc;

f = @(x) x.^2 - 612;
xx = linspace(10., 30., 101);

[x, y, h] = bisekcja(f, 10., 30., 100, 1e-8);

subplot(211)
plot(xx, f(xx), x, y, 'o'), grid on
xlabel('x'), ylabel('y'), legend('sin(x)', 'rozwiazanie')
subplot(212)
semilogy(h(:,1), abs(h(:, 3)), 's-'), grid on
xlabel('x'), ylabel('y'), legend('historia')