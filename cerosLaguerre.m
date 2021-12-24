
%Apartado 1 ejercicio 1.
%Funcion de biblioteca que devuelve los n+1 (desde 0 hasta n) polinomios de 
%Laguerre. Devuelve una matriz con los coeficientes.
function ceros = cerosLaguerre(n)
  
  ceros = zeros(1,7);
  matriz = polyLaguerre(7);
 
  max = 0;
  for i=1:8
    if abs(matriz(8,i)) > max
      max = abs(matriz(8,i));
    endif
  endfor
  radio = 1+max/abs(matriz(8,1));
  radio
  
  [ceros(1), pz, npasos] = newtonPoly(matriz(8,:), 0, 10^-10, 50, 0);
  [ceros(7), pz, npasos] = newtonPoly(matriz(8,:), radio+1, 10^-10, 100, 0);
  [deflacionado, val] = deflacion(matriz(8,:), ceros(1));
  [deflacionado, val] = deflacion(deflacionado, ceros(7));
  [raiz1, pz, npasos] = newtonPoly(deflacionado, ceros(1), 10^-10, 50, 0);
  [raiz2, pz, npasos] = newtonPoly(deflacionado, ceros(7), 10^-10, 50, 0);
  [ceros(2), pz, npasos] = newtonPoly(matriz(8,:), raiz1, 10^-10, 50, 0);
  [ceros(6), pz, npasos] = newtonPoly(matriz(8,:), raiz2, 10^-10, 100, 0);
  [deflacionado, val] = deflacion(deflacionado, ceros(2));
  [deflacionado, val] = deflacion(deflacionado, ceros(6));
  [raiz1, pz, npasos] = newtonPoly(deflacionado, ceros(2), 10^-10, 50, 0);
  [raiz2, pz, npasos] = newtonPoly(deflacionado, ceros(6), 10^-10, 50, 0);
  [ceros(3), pz, npasos] = newtonPoly(matriz(8,:), raiz1, 10^-10, 50, 0);
  [ceros(5), pz, npasos] = newtonPoly(matriz(8,:), raiz2, 10^-10, 100, 0);
  [deflacionado, val] = deflacion(deflacionado, ceros(3));
  [deflacionado, val] = deflacion(deflacionado, ceros(5));
  [raiz1, pz, npasos] = newtonPoly(deflacionado, ceros(3), 10^-10, 50, 0);
  [ceros(4), pz, npasos] = newtonPoly(deflacionado, raiz1, 10^-10, 50, 0);

endfunction