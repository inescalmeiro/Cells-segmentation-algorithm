function [r c] = my_find(A)
% MY_FIND - retorna as linhas e colunas de pontos não nulos
%
% Chamada da função:
%     [r c] = my_find(A)
 
% Variáveis de entrada:
%     A: matriz
 
% Variáveis de saída:
%     r: indíces da linha de valores não nulos
%     c: indíces da coluna de valores não nulos

 
% Objetivo: encontrar os índices que dos valores não nulos


[i j]=size(A);
k=0;
for m=1:i
     for n=1:j
         if A(m,n)~=0
             k=k+1;
             r(k)=m;
             c(k)=n;
         end
     end
end
end
