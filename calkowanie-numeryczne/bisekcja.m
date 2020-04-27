function [miejsceZerowe, bledyRozwiazan] = bisekcja(f, a, b, maksIteracji, eps)
%BISEKCJA Znajdowanie miejsca zerowego metoda bisekcji

s = (a + b) / 2;
bledy = zeros(1, maksIteracji);
bledy(1) = abs(f(s)); %Poniewaz juz na poczatku moze byc ponizej eps

i = 1;
while (abs(f(s)) > eps) && (i <= maksIteracji)
    s = (a + b) / 2;
    
    if f(a)*f(s) < 0
        b = s;
    else
        a = s;
    end
    
    bledy(i) = abs(f(s));
    i = i+1;
end

miejsceZerowe = s;
bledyRozwiazan = bledy(1, 1:i-1);
end