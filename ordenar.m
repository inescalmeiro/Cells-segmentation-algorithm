function vetoro = ordenar(vetor)
% ORDENAR - ordena por ordem crescente os valores de um vetor
%
% Chamada da função:
%     vetoro = ordenar(vetor)
 
% Variáveis de entrada:
%     vetor: vetor de entrada

% Variáveis de saída:
%     vetoro: vetor com os valores do vetor introduzido ordenados por ordem
%     crescente
 
% Outras variáveis locais:
%     minimo: valor mínimo do vetor introduzido
 
% Objetivo: ordena por ordem crescente todos os valores do vetor
% inicialmente introduzido

vetoro = [];
minimo = my_min(vetor);
for i = 1:length(vetor)
    max = vetor(1);
    p = 1;
    for k = 1:length(vetor)
        if vetor(k)>max
            max = vetor(k);
            p = k;
        end
    end
    vetoro = [max vetoro];
    vetor(p)= minimo-1;            
end
end
