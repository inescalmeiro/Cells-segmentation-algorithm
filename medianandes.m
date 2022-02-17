function mediana = medianandes(vetor)
% MEDIANANDES - calcula a mediana dos valores de um determinado vetor,
% podendo o n�mero de elementos deste vetor ser par ou impar
%
% Chamada da fun��o:
%     mediana = medianandes(vetor)
 
% Vari�veis de entrada:
%     vetor: vetor de entrada
 
% Vari�veis de sa�da:
%     mediana: mediana dos valores ordenados do vetor a analisar
 
% Outras vari�veis locais:
%     N: comprimento do vetor a analisar
 
% Objetivo: obter a mediana de um vetor, sendo o n�mero de elementos deste
% vetor par ou �mpar, atrav�s da sua ordena��o e posterior c�lculo da
% mediana

vetor = ordenar(vetor);
N = length(vetor);
    if floor(N/2) == N/2            
    mediana = (vetor(N/2)+ vetor((N/2)+1))/2; 
    else 
    mediana = vetor(ceil(N/2));  
    end
end
