function [x, y, h] = sieczne(fun, xw, a0, maxit, eps)
h = NaN(maxit, 3);
x0 = xw;
x1 = a0;
for i=3:maxit
    x = (x0 * fun(x1) - x1 * fun(x0)) / (fun(x1) - fun(x0));
    h(i, :) = [i x fun(x)];
    if abs(fun(x)) <= eps
        fprintf('Funkcja jest wystarczjąco blisko rozwiązania (%g <= %g)\n', abs(fun(x)), eps);
        fprintf('Zatrzymanie po %d iteracji\n', i);
        break;
    end
    x0 = x1;
    x1 = x;
    if i == maxit
            fprintf('Osiągnięto maksymalną liczbę iteracji!\n');
    end
end
y = fun(x);
end

