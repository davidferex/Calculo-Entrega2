clc
close all
clear all
addpath('../Biblioteca')
output_precision(16);

g = @(y) e.^(-y.^2);


F = @(x) trapecio(g, -sqrt(1-x.^2), sqrt(1-x.^2), 200);
h = @(x) F(x).*e.^(-x.^2);
resultadoTrapecio = trapecio(h, -1, 1, 200)

F = @(x) simpson(g, -sqrt(1-x.^2), sqrt(1-x.^2), 200);
h = @(x) F(x).*e.^(-x.^2);
resultadoSimpson = simpson(h, -1, 1, 200)

F = @(x) gaussLegendre(g, -sqrt(1-x.^2), sqrt(1-x.^2), 20, 10);
h = @(x) F(x).*e.^(-x.^2);
resultadoGauss = gaussLegendre(h, -1, 1, 20, 10)


%He usado gaussLegendre porque, tras hacer varias pruebas (y conociendo de 
%antemano el resultado que debe dar la integral), me die cuenta de que usando simpson
%salia un resultado bastante alejado, pero con gaussLegendre sale exacto.


rmpath('../Biblioteca')