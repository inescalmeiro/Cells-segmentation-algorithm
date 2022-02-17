function minimo = my_min(vetor)
% MY_MIN - calcula o valor m�nimo de um vetor
%
% Chamada da fun��o:
%     minimo = my_min(vetor)
 
% Vari�veis de entrada:
%     vetor: vetor de entrada
 
% Vari�veis de sa�da:
%     minimo: valor m�nimo dos valores correspondentes ao vetor introduzido
 
 
% Outras vari�veis locais:
%     i:
 
% Objetivo: calcular o valor m�nimo de entre os valores de um determinado
% vetor introduzido

minimo = vetor(1);
for i = 1:numel(vetor)
    if vetor(i)<minimo
        minimo = vetor(i);
    end
end
end