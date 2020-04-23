%% newton_raphson
clear all;
close all;
clc;

f = @(x) sin(x);
df = @(x) cos(x);
xx = linspace(0.5*pi, 1.5*pi, 101);

[x, y, h] = newton_raphson_1(f, df, 1.23*pi, 100, 1e-15);

subplot(211)
plot(xx, f(xx), x, y, 'o'), grid on
xlabel('x'), ylabel('y'), legend('sin(x)', 'rozwiazanie')
subplot(212)
semilogy(h(:,1), abs(h(:, 3)), 's-'), grid on
%semilogy(h(:,1), h(:, 2), 's-'), grid on
xlabel('x'), ylabel('y'), legend('historia')

%% root 
clear all;
close all;
clc;

f = @(x) x*x*x - 3;
df = @(x) 2*x*x;

[x, y, h] = newton_raphson_1(f, df, 1e-3, 100, 1e-15);

fprintf('%g %g\n', x, 3^(1/3));

it = h(:, 1);
er = abs(h(:,3));
semilogy(it, er, '.-'), grid on
xlabel('Numer iteracji')

%% wplyw punktu poczatkowego
clear all;
close all;
clc;
f = @(x) x.^3 - 2*x.^2 - 11*x + 12;
df = @(x) 3*x.^2 - 4*x + 11;
x = -4:0.1:4;
subplot(211)
plot(x, f(x), x, df(x)), grid on;
legend('f(x)', 'df(x)');
maxit = 50;
epsilon  = 1e-15;
h = NaN(maxit, 3, 5);
[~,~,h(:,:,1)] = newton_raphson_1(f, df, -1.35, maxit, epsilon);
[~,~,h(:,:,2)] = newton_raphson_1(f, df, -1.37, maxit, epsilon);
[~,~,h(:,:,3)] = newton_raphson_1(f, df, -0.6, maxit, epsilon);
[~,~,h(:,:,4)] = newton_raphson_1(f, df, 2.69, maxit, epsilon);
[~,~,h(:,:,5)] = newton_raphson_1(f, df, 2.7, maxit, epsilon);

%subplot(211)
subplot(212)
semilogy(h(:,1,1), abs(h(:,3,1)), 'r.-'), hold on;
semilogy(h(:,1,2), abs(h(:,3,2)), 'ro-'), hold on;
semilogy(h(:,1,3), abs(h(:,3,3)), 'k.-'), hold on;
semilogy(h(:,1,4), abs(h(:,3,4)), 'b.-'), hold on;
semilogy(h(:,1,5), abs(h(:,3,5)), 'bo-'), grid on;
legend('x0=-1.35','x0=-1.37','x0=-0.6','x0=2.69','x0=2.7'), xlabel('Numer iteracji'), ylabel('wartosc bezwzgledna(f(xk)')

%dziwny wykres z dwoma osiami y
%x0 = -4:0.01:4;
%yk = zeros(size(x0));
%xk = zeros(size(x0));
%it = zeros(size(x0));
%for i=1:length(x0)
%    [xk(i), yk(i), h, it(i)] = newton_raphson_1(f, df, , maxit, epsilon);
%end
%subplot(212)