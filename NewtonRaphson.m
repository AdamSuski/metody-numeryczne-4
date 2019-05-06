function [miejsceZerowe, bledyRozwiazan] = NewtonRaphson(f, df, x0, maksIteracji, eps)
%NEWTONRAPSOD1 Znajdowanie miejsca zerowego metoda Newtona-Raphsona I rzedu

miejsceZerowe = x0;

%Bledy roziazan beda wartosciamy bezwzglednymy f(xi)
bledy = zeros(1, maksIteracji+1);
bledy(1) = abs(f(miejsceZerowe));

i = 1;
while (abs(f(miejsceZerowe)) > eps) && (i <= maksIteracji)
    
    miejsceZerowe = miejsceZerowe - f(miejsceZerowe)/df(miejsceZerowe);
    
    i = i+1;
    bledy(i) = (abs(f(miejsceZerowe)));
end

bledyRozwiazan = bledy(1, 1:i);
end
