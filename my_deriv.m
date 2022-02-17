function der = my_deriv(image,tipo)
% MY_DERIV - calcula a derivada da imagem, mostra a variação de 
%           luminusidade entre os pixels
%
% Chamada da função:
%     der = my_deriv(IMAGE,tipo)
 
% Variáveis de entrada:
%     IMAGE: imagem pré-processada através de rgb2gray e normalização
%     tipo: depende do local onde a função for utilizada, é 1 e 2 para a 
%           função cont e 3 para a função get_info
 
% Variáveis de saída:
%     der: imagem derivada

% Outras variáveis locais:
%     derx: matriz de zeros 
%     dery: matriz de zeros
 
% Objetivo: calcular a derivada de primeira ordem de cada ponto da imagem introduzida ao longo de cada linha e coluna

[i j] = size(image);
derx = zeros(i,j);
dery = zeros(i,j);
for m = 2:i-1
    for n = 2:j-1
        derx(m,n) = (image(m+1,n)-image(m-1,n))/2;
        dery(m,n) = (image(m,n+1)-image(m,n-1))/2;
    end
end

%Switch permite output de três derivadas diferentes
switch tipo
    case 1
        der = derx;
    case 2
        der = dery;
    case 3
        der = (derx + dery)/2;
end

end