function vetor = vetviz(IMAGE,x,y,viz)
% VETVIZ - cria um vetor com os elementos da vizinhan�a de um ponto que n�o
% se encontre nas bordas da imagem
%
% Chamada da fun��o:
%     vetor = vetviz(IMAGE,x,y,viz)
 
% Vari�veis de entrada:
%     IMAGE: imagem pr�-processada atrav�s de rgb2gray e normaliza��o
%     x: abcissa do ponto a analisar
%     y: ordenada do ponto a analisar
%     viz: vizinhan�a escolhida pelo utilizador
 
% Vari�veis de sa�da:
%     vetor: vetor com o valor de um ponto e os valores dos pontos na sua
%     vizinhan�a
 
% Outras vari�veis locais:
%     d: alcance da vizinhan�a relativamente ao ponto em estudo
%     x1: abcissa do ponto a partir do qual come�a a vizinhan�a em estudo
%     y1: ordenada do ponto a partir do qual come�a a vizinhan�a em estudo
 
% Objetivo: criar um vetor com o valor de um ponto e de todos os valores
% que se encontrem na sua respetiva vizinhan�a, definida pelo utilizador,
% come�ando por diferenciar no caso da vizinhan�a ser par ou �mpar e depois
% atrav�s de um ciclo que l� e armazena estes valores

vetor = [];
d = floor(viz/2);                    

%Defini��o dos limites das vizinhan�as

if d==viz/2                           %Vizinhan�a par
    x1 = x-d+1;                       
    y1= y-d+1;
else                                  %Vizinhan�a impar
    x1 = x-d;
    y1 = y-d;
end   

     for n = x1:x+d                    %Ciclo que l� os valores da vizinhan�a
            for m = y1:y+d             %e os armazena num vetor
                valor = IMAGE(n,m);
                vetor = [vetor valor];
            end
     end
end


