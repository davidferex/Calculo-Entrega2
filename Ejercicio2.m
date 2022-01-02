clc
close all
clear all
addpath('../Biblioteca')
output_precision(16);

g = @(y) e.^(-y.^2);

%Con trapecio:
F = @(x) trapecio(g, -sqrt(1-x.^2), sqrt(1-x.^2), 200);
h = @(x) F(x).*e.^(-x.^2);
resultadoTrapecio = trapecio(h, -1, 1, 200)

%con simpson:
F = @(x) simpson(g, -sqrt(1-x.^2), sqrt(1-x.^2), 200);
h = @(x) F(x).*e.^(-x.^2);
resultadoSimpson = simpson(h, -1, 1, 200)

%Con Gauss:
F = @(x) gaussLegendre(g, -sqrt(1-x.^2), sqrt(1-x.^2), 20, 10);
h = @(x) F(x).*e.^(-x.^2);
resultadoGauss = gaussLegendre(h, -1, 1, 20, 10)

%Voy redefiniendo la F para ir usando los diferentes métodos.
%seguramente no es necesario redefinir la h, pero lo hago por si acaso.


rmpath('../Biblioteca')