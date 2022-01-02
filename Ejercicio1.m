clc
close all
clear all
addpath('../Biblioteca')
output_precision(16);

%Apartado 3, uso la funcion del ejercicio 3 de la entrega 1.
ceros7 = cerosLaguerre(7);
Lagrangeceros = factLagrange(ceros7);

%Apartado 4: haciendo partes, vemos que la intergal es k!
for i=1:7
  grado = length(Lagrangeceros(i,:)) -1;
  auxiliar = 0;
  for j=1:length(Lagrangeceros(i,:))
    auxiliar = auxiliar + factorial(grado)*Lagrangeceros(i,j);
    grado = grado - 1;
  endfor
  pesos(i) = auxiliar;
endfor

%Tengo que pasar pesos y los ceros porque no me deja usar las variables definidas
%fuera.
function resultado = integral(f, pesos, ceros)
  %Apartado 5
  suma = 0;
  for i=1:7
    suma = suma + pesos(i)*f(ceros(i));
  endfor
  resultado = suma;
endfunction

%Apartado 6
f = @(x) 1;
g = @(x) x;
integral1 = integral(f, pesos, ceros7)
integral2 = integral(g, pesos, ceros7)

%Apartado 7
h1 = @(x) x.*cos(x);
integral3 = integral(h1, pesos, ceros7)

%En esta integral hay que buscar la forma de expresarla como h2*e^-x:
h2 = @(x) e.^(2.*x - x.^2);
integral4 = integral(h2, pesos, ceros7)

rmpath('../Biblioteca')
