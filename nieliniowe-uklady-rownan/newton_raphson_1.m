function [x, y, h] = newton_raphson_1(fun, fun_poch, x0, maxit, eps)
    h = NaN(maxit, 3);

    for i = 1:maxit
        x = x0 - fun(x0) / fun_poch(x0);
        h(i, :) = [i x fun(x)];
        if abs(fun(x)) <= eps
            fprintf('Function is close enough (%g <= %g)\n', abs(fun(x)), eps);
            fprintf('Stopped after %d iterations\n', i);
            break;
        end
    end
    
    x = x0 - fun(x0) / fun_poch(x0);
    y = fun(x);
end

