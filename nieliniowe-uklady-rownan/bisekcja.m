function m = bisekcja(fun, x0, a0, n)
x = x0;
a = a0;

for i=1:n
    m = (x + a) / 2;
    if fun(x) * fun(m) < 0
        a = m;
    else
        x = m;
    end
end
end

