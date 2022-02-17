function minimo = my_min(vetor)
% MY_MIN - calcula o valor mínimo de um vetor
%
% Chamada da função:
%     minimo = my_min(vetor)
 
% Variáveis de entrada:
%     vetor: vetor de entrada
 
% Variáveis de saída:
%     minimo: valor mínimo dos valores correspondentes ao vetor introduzido
 
 
% Outras variáveis locais:
%     i:
 
% Objetivo: calcular o valor mínimo de entre os valores de um determinado
% vetor introduzido

minimo = vetor(1);
for i = 1:numel(vetor)
    if vetor(i)<minimo
        minimo = vetor(i);
    end
end
end