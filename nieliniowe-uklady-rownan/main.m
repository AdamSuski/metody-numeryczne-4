%% praca na laboratorium
clear all;
close all;
clc;
maxit = 1000;
eps = 1e-8;
start = -2;
koniec = 2;
x = linspace(-2.0, 2.0, maxit+1);
f = @(x) sin(x.^2) - x.^3 + 0.1*x - 5;
df = @(x) 2*x.*cos(x.^2) - 3*x.^2 + 0.1;

subplot(211)
plot(x, f(x), x, df(x)), grid on;
legend('f(x)', 'df(x)'), xlabel('x'), ylabel('Wartosci'), title('Funkcja i jej pochodna');


subplot(212)
h = NaN(maxit, 3, 5);
[xs,~,h(:,:,1)] = sieczne(f, start, koniec, maxit, eps);
fprintf('Dla metody siecznych rozwiązanie wynosi: %g\n', xs);
[xb,~,h(:,:,2)] = bisekcja(f, start, koniec, maxit, eps);
fprintf('Dla metody bisekcji rozwiązanie wynosi: %g\n', xb);
semilogy(h(:,1,2), abs(h(:,3,2)), 's-'), grid on;
xlabel('Liczba iteracji'), ylabel('Blad'), title('zbieznosc bisekcji');
[xnr1,~,h(:,:,3)] = newton_raphson_1(f, df, 1.0, maxit, eps);
fprintf('Dla metody Newtona-Raphsona dla x=%g rozwiązanie wynosi: %g\n', 1.0, xnr1);
[xnr2,~,h(:,:,4)] = newton_raphson_1(f, df, 0.1, maxit, eps);
fprintf('Dla metody Newtona-Raphsona dla x=%g rozwiązanie wynosi: %g\n', 0.1, xnr2);
[xnr3,~,h(:,:,5)] = newton_raphson_1(f, df, 0.0, maxit, eps);
fprintf('Dla metody Newtona-Raphsona dla x=%g rozwiązanie wynosi: %g\n', 0.0, xnr3);

%% kod do sprawozdania 
clear all;
close all;
clc;
%ustawienie wartosci 
maxit = 1000;
eps = 1e-8;
start = -2;
koniec = 2;
f = @(x) sin(x.^2) - x.^3 + 0.1*x - 5;
df = @(x) 2*x.*cos(x.^2) - 3*x.^2 + 0.1;
x = linspace(-2.0, 2.0, maxit+1);
h = NaN(maxit, 3, 5);

%wywolanie funkcji 
[xs,~,h(:,:,1)] = sieczne(f, start, koniec, maxit, eps);
[xb,~,h(:,:,2)] = bisekcja(f, start, koniec, maxit, eps);
[xnr1,~,h(:,:,3)] = newton_raphson_1(f, df, 1.0, maxit, eps);
[xnr2,~,h(:,:,4)] = newton_raphson_1(f, df, 0.1, maxit, eps);
[xnr3,~,h(:,:,5)] = newton_raphson_1(f, df, 0.0, maxit, eps);

%wypisanie wynikow
fprintf('Dla metody siecznych rozwiązanie wynosi: %g\n', xs);
fprintf('Dla metody bisekcji rozwiązanie wynosi: %g\n', xb);
fprintf('Dla metody Newtona-Raphsona dla x=%g rozwiązanie wynosi: %g\n', 1.0, xnr1);
fprintf('Dla metody Newtona-Raphsona dla x=%g rozwiązanie wynosi: %g\n', 0.1, xnr2);
fprintf('Dla metody Newtona-Raphsona dla x=%g rozwiązanie wynosi: %g\n', 0.0, xnr3);

%tworzenei wykresow
subplot(331)
semilogy(h(:,1,1), abs(h(:,3,1)), 's-'), hold on;
semilogy(h(:,1,2), abs(h(:,3,2)), 's-'), hold on;
semilogy(h(:,1,3), abs(h(:,3,3)), 's-'), hold on;
semilogy(h(:,1,4), abs(h(:,3,4)), 's-'), hold on;
semilogy(h(:,1,5), abs(h(:,3,5)), 's-'), grid on;
legend('bisekcja', 'sieczne', 'newton-raphson x=1.0','newton-raphson x=0.1', 'newton-raphson x=0.0'), 
xlabel('Liczba iteracji'), ylabel('Blad'), title('Wykres zbiorczy zbieżności');

subplot(332)
semilogy(h(:,1,1), abs(h(:,3,1)), 's-'), grid on;
xlabel('Liczba iteracji'), ylabel('Blad'), title('Zbieżność metody bisekcji');

subplot(333)
semilogy(h(:,1,2), abs(h(:,3,2)), 's-'), grid on;
xlabel('Liczba iteracji'), ylabel('Blad'), title('Zbieżność metody siecznych');

subplot(334)
semilogy(h(:,1,3), abs(h(:,3,3)), 's-'), grid on;
xlabel('Liczba iteracji'), ylabel('Blad'), title('Zbieżność metody Newtona-Raphsona 1 rzedu dla x=1.0');

subplot(335)
semilogy(h(:,1,4), abs(h(:,3,4)), 's-'), grid on;
xlabel('Liczba iteracji'), ylabel('Blad'), title('Zbieżność metody Newtona-Raphsona 1 rzedu dla x=0.1');

subplot(336)
semilogy(h(:,1,5), abs(h(:,3,5)), 's-'), grid on;
xlabel('Liczba iteracji'), ylabel('Blad'), title('Zbieżność metody Newtona-Raphsona 1 rzedu dla x=0.0');
