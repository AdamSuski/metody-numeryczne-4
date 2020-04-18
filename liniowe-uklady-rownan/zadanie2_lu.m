clear all;
close all;
clc;

blue = load('blue.mat');
A = blue.A;
b = blue.b;
x_ref = blue.x_ref;

[L, U] = get_lu_with_crout_doolittle(A);
x_wynik = lu_licz(A, b);

blad_rozwiazania = norm(A * x_wynik - b, 2);
disp('Blad rozwiazania to: ');
disp(blad_rozwiazania);
blad_rozkladu = norm(abs(A - L * U), 'fro');
disp('Blad rozkladu to: ');
disp(blad_rozkladu);