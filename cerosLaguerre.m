
%Apartado 2 ejercicio 1.
%Funcion de biblioteca que devuelve los 7 ceros del polinomio G7 de laguerre
function ceros = cerosLaguerre()
  
  ceros = zeros(1,7);
  matriz = polyLaguerre(7);
 
 %Uso el resultado 4.35 de las notas del curso, busco ese anillo.
  max = 0;
  for i=1:8
    if abs(matriz(8,i)) > max
      max = abs(matriz(8,i));
    endif
  endfor
  radio = 1+max/abs(matriz(8,1));
  radio2 = 1+max/abs(matriz(8,8));
  radio2 = 1/radio2;
  
  %Para el primer cero empiezo en radio2 menos un poco, para el segundo uso el radio.
  %Notese que uso 10^-10 porque es un numero pequeño, pero podria ser 0,1.La 
  %cosa es que si uso un numero demasiado grande se irá a un punto negativo (no es 
  %dificil que ocurra esto, esta todo muy cercano al 0) y eso no nos beneficia. 
  %Sabemos que los ceros son positivos, asi que no tiene sentido empezar en negativos.
  [ceros(1), pz, npasos] = newtonPoly(matriz(8,:), radio2-10^-10, 10^-10, 100, 0);
  [ceros(7), pz, npasos] = newtonPoly(matriz(8,:), radio+1, 10^-10, 100, 0);
  %Inicializo el deflacionado así para poder meter todo el proceso en un for
  deflacionado = matriz(8,:);
  %Sigo los pasos indicados, haciendo el deflacionado y usando las raices del 
  %deflacionado como punto inicial para buscar ceros en el polinomio.
  for i=0:2
    if i == 2
      [deflacionado, val] = deflacion(deflacionado, ceros(3));
      [deflacionado, val] = deflacion(deflacionado, ceros(5));
      [raiz1, pz, npasos] = newtonPoly(deflacionado, ceros(3), 10^-10, 100, 0);
      [ceros(4), pz, npasos] = newtonPoly(matriz(8,:), raiz1, 10^-10, 100, 0);
    else
      [deflacionado, val] = deflacion(deflacionado, ceros(1+i));
      [deflacionado, val] = deflacion(deflacionado, ceros(7-i));
      [raiz1, pz, npasos] = newtonPoly(deflacionado, ceros(1+i), 10^-10, 100, 0);
      [raiz2, pz, npasos] = newtonPoly(deflacionado, ceros(7-i), 10^-10, 100, 0);
      [ceros(1+i+1), pz, npasos] = newtonPoly(matriz(8,:), raiz1, 10^-10, 100, 0);
      [ceros(7-i-1), pz, npasos] = newtonPoly(matriz(8,:), raiz2, 10^-10, 100, 0);
    endif
  endfor

endfunction