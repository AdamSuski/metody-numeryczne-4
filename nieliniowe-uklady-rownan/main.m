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
