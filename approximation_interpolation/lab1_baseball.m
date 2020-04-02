clc;
clf;
clear;
load('dane_baseball.mat');
x = s(:,1)';
y = s(:,2)';


plot(x,y,'x');
grid on;
hold on;

stopniePrzedzial = 10:1/2:64;
wielomian = wielomianAproks(x,y,3);

fprintf('Wspolczynniki aproksymacji: a: %f, b: %f, c: %f.\n', wielomian(1), wielomian(2), wielomian(3));
f = @(x) wielomian(1) .* x .^ 2 + wielomian(2) .* x + wielomian(3); 

blad = mean((y - f(x)) .^ 2);

fprintf('Blad sredniokwadratowy wynosi: %f.\n', blad);

max_kat = -wielomian(2) / (2 * wielomian(1));
fprintf('Maksymalny kąt rzutu wynosi: %f\n', max_kat);

plot(stopniePrzedzial,f(stopniePrzedzial),'-');
grid on;
title('Aproksymacja funkcja kwadratowa');
xlabel('Kat rzutu [stopnie]');
ylabel('Zasieg rzutu [stopy]');
legend('Dane z pliku','Wartosci aproksymowane');