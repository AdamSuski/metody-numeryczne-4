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

%% newton_raphson
clear all;
close all;
clc;

f = @(x) six(x);
df = @(x) cos(x);
xx = linspace(0.5*pi, 1.5*pi, 101);

[x, y, h] = newton_raphson_1(f, df, 1.23*pi, 100, 1e-15);

subplot(211)
plot(xx, f(xx), x, y, 'o'), grid on
xlabel('x'), ylabel('y'), legend('sin(x)', 'rozwiazanie')
subplot(212)
semilogy(h(:,1), abs(h(:, 3)), 's-'), grid on
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

%% wplyw punktu pocatkwoego
f = @(x) x.^3 - 2*x.^2 - 11*x + 12;
f = @(x) 3*x.^2 - 4*x + 11;
x = -4:0.1:4;
plot(x, f(x), x, df(x)), grid on
legend('f(x)', 'df(x)')
maxit = 50;
h = NaN(maxit, 3, 5);
[~,~,h(:,:,1)] = newton_raphson_1(f, df, -1,35, maxit, epsilon);
[~,~,h(:,:,2)] = newton_raphson_1(f, df, -1,37, maxit, epsilon);
[~,~,h(:,:,3)] = newton_raphson_1(f, df, -0,6, maxit, epsilon);
[~,~,h(:,:,4)] = newton_raphson_1(f, df, 2,69, maxit, epsilon);
[~,~,h(:,:,5)] = newton_raphson_1(f, df, 2,7, maxit, epsilon);

subplot(211)

subplot(212)


epsilon  = 1e-15;