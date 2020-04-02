function [miejsceZerowe , bledyRozwiazan] = polaczoneMetody(f, df, a, b, maksIteracji, eps, alfa)
%POLACZONEMETODY Znajdowanie miejsca zerowego z wykozystaniem polaczenia
%metod bisekcji i Newtona Raphsona

s = (a + b) / 2;
bledy = zeros(1, maksIteracji);
bledy(1) = abs(f(s)); %Poniewaz juz na poczatku moze byc ponizej eps

i = 1;
%Metoda bisekcji
while (abs(f(s)) > eps) && (i <= maksIteracji) && (abs(f(s)) > alfa)
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

%Metoda NR
while (abs(f(s)) > eps) && (i <= maksIteracji)
    miejsceZerowe = miejsceZerowe - f(miejsceZerowe)/df(miejsceZerowe);
    
    bledy(i) = (abs(f(miejsceZerowe)));
    i = i+1;
end

bledyRozwiazan = bledy(1, 1:i-1);
end