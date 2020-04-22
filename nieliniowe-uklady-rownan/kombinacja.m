function [x, y, h] = kombinacja(fun, dfun, a, b, maxit, eps, alpha)
    h = NaN(maxit, 3);
    it = ceil(log2((b - a)/alpha));
    [x1, ~, h(1:end,:)] = bisekcja(fun, a, b, maxit, aplha);
    [x, y, h(it+1:end,:)] = newton_raphson_1(fun, dfun, x1, maxit - it, eps);
    h(it+1:end, 1) = h(it+1:end, 1) + it;
end

