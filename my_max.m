function maximo = my_max(vetor)
% MY_MAX - calcula o valor máximo de um vetor
%
% Chamada da função:
%     maximo = my_max(vetor)
 
% Variáveis de entrada:
%     vetor: vetor de entrada
 
% Variáveis de saída:
%     maximo: valor máximo do vetor introduzido

% Objetivo: identificar o valor máximo entre os valores correspondentes a
% um determinado vetor introduzido
maximo = vetor(1);
for i = 1:numel(vetor)
    if vetor(i)>maximo
        maximo = vetor(i);
    end
end
end