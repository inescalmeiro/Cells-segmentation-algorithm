function vetor = notnegone(valores)
% NOTNEGONE - analisa os valores de um vetor descartando-os no caso de
% serem -1
%
% Chamada da fun��o:
%     vetor = notnegone(valores)
 
% Vari�veis de entrada:
%     valores: vetor de entrada, neste contexto corresponde a um vetor com
%     os valores da vizinhan�a
 
% Vari�veis de sa�da:
%     vetor: vetor com os valores do vetor inicial excluindo os -1
 
% Objetivo: analisar um determinado vetor e excluir os valores
% correspondetes a -1

vetor = [];
 for i=1:numel(valores)               
    if valores(i)~=-1                
        vetor = [vetor valores(i)];
    end
 end
end