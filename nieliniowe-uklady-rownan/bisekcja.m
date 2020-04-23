function [x, y, h] = bisekcja(fun, a, b, maxit, eps)
    h = NaN(maxit, 3);

    for i=1:maxit
        m = (a + b) / 2;
        h(i, :) = [i m fun(m)];
    
        if abs(fun(m)) <= eps
            fprintf('Funkcja jest wystarczjąco blisko rozwiązania (%g <= %g)\n', abs(fun(m)), eps);
            fprintf('Zatrzymanie po %d iteracji\n', i);
            break;
        end
    
        dx = b - a;
        if abs(dx) <= eps
            fprintf('Dystans jest wystarczający (%g <= %g)\n', abs(dx), eps);
            fprintf('Zatrzymanie po %d iteracji\n', i);
            break;
        elseif fun(a) * fun(m) < 0
            b = m;
        elseif fun(b) * fun(m) < 0
            a = m;
        end
        if i == maxit
            fprintf('Maximum number of iterations reached!\n');
        end
    end
    
    x = (a + b) / 2;
    y = fun(x);
end
