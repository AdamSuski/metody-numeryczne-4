%% kombinacja
maxit = 1000;
f = @(x) sin(x.^2) - x.^3 + 0.1*x -5;
df = @(x) 2*x.*cos(x.^2) - 3*x.^2 + 0.1;
x0 = -2:0.01:2;
yk = zeros(1, 2);
xk = zeros(1, 2);
it = zeros(1, 2);
h = NaN(maxit, 3, 2);

[xk(1), yk(1), h(:,:,1)] = kombinacja(f, df, -2, 2, maxit, 1e-15, 1e-8);
[xk(2), yk(2), h(:,:,2)] = newton_raphson_1(f,df, 0.0, maxit, 1e-15);
semilogy(h(:,1,1), abs(h(:,3,1)), 'o-'), hold on
semilogy(h(:,1,2), abs(h(:,3,2)), 'o-'), grid on
legend('polaczona', 'Newton-Raphson'), xlabel('Numer iteracji'), ylabel('Wartość bezwzględna błędu') 