clc
close all
clear all
addpath('../Biblioteca')
output_precision(16);

function resultado = integral(f)
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
  suma = 0;
  for i=1:7
    suma = suma + pesos(i)*f(ceros7(i));
  endfor
  resultado = suma;
endfunction

f = @(x) 1;
g = @(x) x;
integral1 = integral(f)
integral2 = integral(g)

h1 = @(x) x.*cos(x);
integral3 = integral(h1)

h2 = @(x) e.^(2*x - x^2);
integral4 = integral(h2)

rmpath('../Biblioteca')
