function [x, y, h] = bisekcja(fun, a, b, maxit, eps)
    h = NaN(maxit, 3);

    for i=1:maxit
        m = (a + b) / 2;
        h(i, :) = [i m fun(m)];
    
        if abs(fun(m)) <= eps
            fprintf('Function is close enough (%g <= %g)\n', abs(fun(m)), eps);
            fprintf('Stopped after %d iterations\n', i);
            break;
        end
    
        dx = b - a;
        if abs(dx) <= eps
            fprintf('Distance is close enough (%g <= %g)\n', abs(dx), eps);
            fprintf('Stopped after %d iterations\n', i);
            break;
        elseif fun(a) * f(m) < 0
            b = m;
        elseif fun(b) * f(m) < 0
            a = m;
        end
        if i == maxit
            fprintf('Maximum number of iterations reached!\n');
        end
    end
    
    x = (a + b) / 2;
    y = f(x);
end
