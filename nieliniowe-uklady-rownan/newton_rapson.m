function x = newton_rapson(fun, fun_poch, x0, rzad)
if rzad == 1
    x = x0 - fun(x0) / fun_poch(x0);
elseif rzad == 2
    %too much, TODO later
end
end

