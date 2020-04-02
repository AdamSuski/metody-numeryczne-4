function wezly = daj_wezly(n,f)
    wezly = zeros(2,n);
    w1 = linspace(0,2,n);
    w2 = zeros(1,n);
    for i = 1:n
         w2(1,i) = f(w1(1,i));
    end
    wezly(1,:) = w1;
    wezly(2,:) = w2;
end