function [] = sieczne(fun, x0, a0, n)
x = zeros(n+2);
x(1) = x0;
x(2) = a0;

for i = 3:n
    x(i) = (x(i-2) * fun(x(i-1)) - x(i-1) * fun(x(i-2))) / (fun(x(i-1)) - fun(x(i-2)));
end

end

