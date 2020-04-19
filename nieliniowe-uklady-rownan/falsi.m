function x_wynik = falsi(fun, x0, a0, n)
x = x0;
a = a0;
x_wynik = x0;

for i = 1:n
    m = (a * fun(x) - x * fun(a)) / (fun(x) - fun(a)); 
    x_wynik = m;
    if fun(m) == 0
        return
    end
    if fun(m) * fun(x) > 0
        x = m;
        %a = a;
    elseif fun(m) * fun(x) < 0
        %x = x;
        a = m;
    end
end

end