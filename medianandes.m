function mediana = medianandes(vetor)
% MEDIANANDES - calcula a mediana dos valores de um determinado vetor,
% podendo o número de elementos deste vetor ser par ou impar
%
% Chamada da função:
%     mediana = medianandes(vetor)
 
% Variáveis de entrada:
%     vetor: vetor de entrada
 
% Variáveis de saída:
%     mediana: mediana dos valores ordenados do vetor a analisar
 
% Outras variáveis locais:
%     N: comprimento do vetor a analisar
 
% Objetivo: obter a mediana de um vetor, sendo o número de elementos deste
% vetor par ou ímpar, através da sua ordenação e posterior cálculo da
% mediana

vetor = ordenar(vetor);
N = length(vetor);
    if floor(N/2) == N/2            
    mediana = (vetor(N/2)+ vetor((N/2)+1))/2; 
    else 
    mediana = vetor(ceil(N/2));  
    end
end
