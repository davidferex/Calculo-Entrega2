
%Apartado 1 ejercicio 1.
%Funcion de biblioteca que devuelve los n+1 (desde 0 hasta n) polinomios de 
%Laguerre. Devuelve una matriz con los coeficientes.
function coef = polyLaguerre(n)
  
  %Hago la construccion "a mano" debido a los problemas que pueden aparecer
  %al trabajar con vectores en octave.
  coef = zeros(n+1, n+1);
  coef(1,n+1) = 1;
  coef(2,n+1) = 1;
  coef(2,n) = -1;
  for i=2:n
    pol1 = (2*i - 1).*coef(i,:);
    pol2 = zeros(1,n+1);
    pol2(1, n+1-i:n) = -coef(i,n+1-i+1:n+1);
    pol3 = (i-1).*coef(i-1,:);
    pol = pol1 + pol2(1,:) - pol3;
    pol = (1/i).*pol;
    coef(i+1,:) = pol;
  endfor
  
  
endfunction