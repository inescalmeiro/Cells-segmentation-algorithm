function vetor = vetviz(IMAGE,x,y,viz)
% VETVIZ - cria um vetor com os elementos da vizinhança de um ponto que não
% se encontre nas bordas da imagem
%
% Chamada da função:
%     vetor = vetviz(IMAGE,x,y,viz)
 
% Variáveis de entrada:
%     IMAGE: imagem pré-processada através de rgb2gray e normalização
%     x: abcissa do ponto a analisar
%     y: ordenada do ponto a analisar
%     viz: vizinhança escolhida pelo utilizador
 
% Variáveis de saída:
%     vetor: vetor com o valor de um ponto e os valores dos pontos na sua
%     vizinhança
 
% Outras variáveis locais:
%     d: alcance da vizinhança relativamente ao ponto em estudo
%     x1: abcissa do ponto a partir do qual começa a vizinhança em estudo
%     y1: ordenada do ponto a partir do qual começa a vizinhança em estudo
 
% Objetivo: criar um vetor com o valor de um ponto e de todos os valores
% que se encontrem na sua respetiva vizinhança, definida pelo utilizador,
% começando por diferenciar no caso da vizinhança ser par ou ímpar e depois
% através de um ciclo que lê e armazena estes valores

vetor = [];
d = floor(viz/2);                    

%Definição dos limites das vizinhanças

if d==viz/2                           %Vizinhança par
    x1 = x-d+1;                       
    y1= y-d+1;
else                                  %Vizinhança impar
    x1 = x-d;
    y1 = y-d;
end   

     for n = x1:x+d                    %Ciclo que lê os valores da vizinhança
            for m = y1:y+d             %e os armazena num vetor
                valor = IMAGE(n,m);
                vetor = [vetor valor];
            end
     end
end


