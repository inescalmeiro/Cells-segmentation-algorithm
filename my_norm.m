function norm = my_norm(image)
% MY_NORM - normaliza a imagem introduzida, ou seja, os valores dos pixels 
% da imagem ficam compreendidos entre 0 e 1
 
% Chamada da função:
%     norm = my_norm(image)
 
% Variáveis de entrada:
%     image: imagem pré-processada através de rgb2gray
 
% Variáveis de saída:
%     norm: imagem normalizada
 
 
% Outras variáveis locais:
%     minimo: valor minimo da matriz correspondente à imagem introduzida
%     maximo: valor maximo da matriz correspondente à imagem introduzida
 
% Objetivo:  normaliza a imagem introduzida, ou seja, os valores dos pixels
% da imagem passam a estar compreendidos entre os valores 0 e 1

image = double(image);
minimo = my_min(image(:));
maximo = my_max(image(:));

norm = (image - minimo)/(maximo - minimo);
end
